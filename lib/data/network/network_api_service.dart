import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../const/app_constants.dart';
import '../api_endpoints.dart';
import '../app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiService extends BaseApiServices {
  final StreamController<dynamic> _webSocketStreamController =
      StreamController<dynamic>.broadcast();
  //------------------------get api response---------------------/

  @override
  Future getGetApiResponse(String path, Map<String, dynamic> queryParameter,
      [String baseUrl = ApiEndPoint.baseUrl]) async {
    dynamic responseJson;
    try {
      final response = await http.get(
          Uri.https(
            baseUrl,
            path,
            queryParameter,
          ),
          headers: {
            //TODO:Bearer api key to be stored in server (for security)
            "Authorization": "Bearer ${AppConstants.bearerToken}",
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*",
            'Access-Control-Allow-Headers': 'Content-Type',
          }).timeout(
        const Duration(seconds: 60),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet");
    }

    return responseJson;
  }

//-----------------------get post api response-------------------//
  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      Response response = await post(
        Uri.https(ApiEndPoint.baseUrl, url),
        body: json.encode(data),
        headers: {
          "Accept": "application/json",
          //'Access-Control-Allow-Headers': 'Content-Type',
          "Access-Control-Allow-Origin": "*",
          "content-type": "application/json",
          "Authorization": "Bearer ${AppConstants.bearerToken}",
          //------------//
        },
      ).timeout(
        const Duration(seconds: 60),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  //--------------------------Put api response-------------------//

  @override
  Future getPutApiResponse(
    String url,
    dynamic data,
  ) async {
    dynamic responseJson;

    try {
      Response response = await put(
        Uri.https(
          ApiEndPoint.baseUrl,
          url,
        ),
        body: json.encode(data),
        headers: {
          //TODO: api key to be stored in server (for security)
          // "APIKey": "5567GGH67225HYVGG",
          "Authorization": "Bearer ${AppConstants.bearerToken}",
          "Accept": "application/json",
          "content-type": "application/json",
          "Access-Control-Allow-Origin": "*",
        },
      ).timeout(
        const Duration(seconds: 60),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  //-----------------------------------------------------------//

  //--------------------------Delete api response-------------------//
  @override
  Future getDeleteApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      Response response = await delete(
        Uri.https(
          ApiEndPoint.baseUrl,
          url,
        ),
        body: json.encode(data),
        headers: {
          //TODO: api key to be stored in server (for security)
          // "APIKey": "5567GGH67225HYVGG",
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
          "content-type": "application/json",
          "Authorization": "Bearer ${AppConstants.bearerToken}",
        },
      ).timeout(
        const Duration(seconds: 60),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostMultiPartApiResponse(
      String url, Map<String, String> data, File image) async {
    dynamic responseJson;

    try {
      var request = MultipartRequest(
        'POST',
        Uri.https(
          ApiEndPoint.baseUrl,
          url,
        ),
      );
      request.headers.addAll({
        "Accept": "application/json",
        //'Access-Control-Allow-Headers': 'Content-Type',
        "Access-Control-Allow-Origin": "*",
        "content-type": "application/json",
        "Authorization": "Bearer ${AppConstants.bearerToken}",
      });
      request.files.add(await MultipartFile.fromPath('file', image.path));
      request.fields.addAll(data);
      StreamedResponse streamResponse = await request.send().timeout(
            const Duration(seconds: 60),
          );
      Response response =
          await convertStreamedResponseToResponse(streamResponse);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  Future<Response> convertStreamedResponseToResponse(
      StreamedResponse streamedResponse) async {
    final bytes = await streamedResponse.stream.toBytes();
    final response = Response.bytes(bytes, streamedResponse.statusCode,
        headers: streamedResponse.headers);
    return response;
  }

  dynamic returnResponse(http.Response response) {
    Map<String, dynamic> error =
        jsonDecode(response.body) as Map<String, dynamic>;
    switch (response.statusCode) {
      case 200:
        // dynamic responseJson = response.body;
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(
          response.body.toString(),
        );
      case 404:
        throw UnauthorisedException(
          response.body.toString(),
        );
      case 505:
        throw InvalidInputException(
          response.body.toString(),
        );
      case 500:
        throw InternalServerException(
          response.body.toString(),
        );
      case 401:
        throw UnAuthorizedException(
          error['message'],
        );
      case 409:
        throw ConflictException(
          error['message'],
        );

      default:
        throw FetchDataException(
          "Error occured while communicating with server with status code${response.statusCode}",
        );
    }
  }

  @override
  Future computeGetApiResponse(String path, Map<String, dynamic> queryParameter,
      [String baseUrl = ApiEndPoint.baseUrl]) async {}

  // @override
  // Future<void> closeWebSocket() {
  //   // TODO: implement closeWebSocket
  //   throw UnimplementedError();
  // }

  // @override
  // Stream listenToWebSocket() {
  //   // TODO: implement listenToWebSocket

  // }
}
