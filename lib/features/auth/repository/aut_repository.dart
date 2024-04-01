import 'package:food_deliver/data/api_endpoints.dart';
import 'package:food_deliver/data/network/base_api_services.dart';
import 'package:food_deliver/data/network/network_api_service.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> sendOTP(dynamic data) async {
    try {
      dynamic response =
          _apiServices.postApiResponse(ApiEndPoint.sendOtp, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signUp(dynamic data) {
    try {
      dynamic response = _apiServices.postApiResponse(ApiEndPoint.signUp, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
