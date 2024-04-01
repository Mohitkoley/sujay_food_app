import 'dart:io';

abstract class BaseApiServices {
  Future<dynamic> getApiResponse(
      String path, Map<String, dynamic> queryParameter,
      [String baseUrl]);

  Future<dynamic> postApiResponse(String url, dynamic data);

  Future<dynamic> putApiResponse(
    String url,
    dynamic data,
  );

  Future<dynamic> deleteApiResponse(
    String url,
    dynamic data,
  );

  Future<dynamic> postMultiPartApiResponse(
      String url, Map<String, String> data, File image);
}
