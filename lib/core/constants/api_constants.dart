/// Configurația serviciului Web (REST API).
class ApiConstants {
  ApiConstants._();

  static const baseUrl = 'https://test-api-jlbn.onrender.com/lab2026/v4';

  /// GET -> datele pentru ecranul Home
  static const feed = '/feed';

  /// GET -> datele pentru ecranul Course Overview
  static const feedDetails = '/feed/details';

  /// Serverul e pe Render (plan gratuit) și „doarme” când nu e folosit:
  /// prima cerere poate dura mult sau poate primi 502/503 cât se trezește.
  static const requestTimeout = Duration(seconds: 30);
  static const maxRetries = 3;
}
