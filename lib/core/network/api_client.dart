import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import '../error/exceptions.dart';

/// Client HTTP generic: construiește URL-ul, trimite cererea, verifică
/// status code-ul, decodează JSON-ul și reîncearcă la erori temporare.
class ApiClient {
  ApiClient({
    http.Client? client,
    this.baseUrl = ApiConstants.baseUrl,
    this.timeout = ApiConstants.requestTimeout,
    this.maxRetries = ApiConstants.maxRetries,
  }) : _client = client ?? http.Client();

  final http.Client _client;
  final String baseUrl;
  final Duration timeout;
  final int maxRetries;

  /// Status-uri pentru care merită să reîncercăm (server care pornește etc.)
  static const _retryStatusCodes = {502, 503, 504};

  /// GET [path] și returnează corpul răspunsului ca obiect JSON.
  Future<Map<String, dynamic>> getJson(String path) async {
    final uri = Uri.parse('$baseUrl$path');
    Object? lastError;

    for (var attempt = 0; attempt <= maxRetries; attempt++) {
      if (attempt > 0) {
        // 2s, 4s, 6s ... între încercări
        await Future<void>.delayed(Duration(seconds: 2 * attempt));
      }
      try {
        final response = await _client
            .get(uri, headers: const {'Accept': 'application/json'})
            .timeout(timeout);

        if (response.statusCode >= 200 && response.statusCode < 300) {
          return _decode(response);
        }
        final error =
            ServerException(response.statusCode, response.reasonPhrase);
        if (!_retryStatusCodes.contains(response.statusCode)) throw error;
        lastError = error;
      } on TimeoutException {
        lastError = const NetworkException('Serverul nu a răspuns la timp.');
      } on http.ClientException catch (e) {
        lastError = NetworkException(e.message);
      }
    }
    throw lastError ?? const NetworkException();
  }

  Map<String, dynamic> _decode(http.Response response) {
    try {
      // utf8 explicit, ca să afișăm corect caractere precum ’
      final body = jsonDecode(utf8.decode(response.bodyBytes));
      if (body is Map<String, dynamic>) return body;
      throw const ParsingException('Răspunsul nu este un obiect JSON.');
    } on FormatException catch (e) {
      throw ParsingException(e.message);
    }
  }

  void close() => _client.close();
}
