/// Excepții aruncate în stratul Data (ApiClient / DataSource).
/// Repository-ul le transformă în [Failure] pentru stratul Domain.

class ServerException implements Exception {
  const ServerException(this.statusCode, [this.message]);
  final int statusCode;
  final String? message;

  @override
  String toString() => 'ServerException($statusCode): $message';
}

class NetworkException implements Exception {
  const NetworkException([this.message]);
  final String? message;

  @override
  String toString() => 'NetworkException: $message';
}

class ParsingException implements Exception {
  const ParsingException([this.message]);
  final String? message;

  @override
  String toString() => 'ParsingException: $message';
}
