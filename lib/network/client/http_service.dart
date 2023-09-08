/// Http Service Interface
abstract class HttpService {
  /// Http base url


  /// Http headers
  Map<String, String> get headers;

  /// Http get request
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool forceRefresh = false,
  });

  /// Http post request
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  /// Http put request
  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  /// Http delete request
  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool forceRefresh = false,
  });
}
