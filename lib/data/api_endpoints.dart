class ApiEndPoint {
  static const String baseUrl =
      'api-staging.roldrive.com'; // "api.roldrive.com";

  // static const String _devbaseUrl =
  //     'api-staging.roldrive.com'; //"api.roldrive.com";

  static const String addressPath = '/api/v1/misc-address';

  static const String coveragePath = '/api/v1/misc-address/check-coverage';

  static const String getDistancePath =
      "/api/v1/misc-address/admin/get-distance";

  static const String getTarrifPath = "/api/v1/tariff";

  static const String checkEmail = "/api/v1/auth/check";

  static const String emailLogin = "/api/v1/auth/email-login";

  static const String emailSignup = "/api/v1/auth/email-signup";

  static const String sendOtp = "/api/v1/auth/send-otp";

  static const String verifyOtp = "/api/v1/auth/verify-otp";

  static const String mobileSignup = "/api/v1/auth/mobile-signup";

  static const String getProfile = "/api/v1/user/profile";

  static const String booking = "/api/v1/booking";

  static const String cardDetails = "/api/v1/card-details";

  static const String addCard = "/api/v1/card-details/create";

  static const String cancelBooking = "/api/v1/booking/cancel/";

  static const String getUserProfile = "/api/v1/users";

  static const String changePassword = "/api/v1/users/password";

  static const String updateUserProfile = "/api/v1/auth/user";

  static const String updateProfileImage = "/api/v1/users/image";

  static const String businessProfile = "/api/v1/business-profiles";

  static const String currentTime = "/api/v1/common/current-time";

  static const String regionForCurrency = "/api/v1/regions";

  static const String getmobileBooking = "/api/v1/booking/app";

  static const String accountSuspension =
      "/api/v1/users/client/account-suspension";

  static const String googleMapBaseUrl = 'maps.googleapis.com';

  static const String googleMapCurrentAddress = "/maps/api/geocode/json";
}

class SocketEndPoint {
  // static String get baseUrl {
  //   if (kReleaseMode) {
  //     return _prodSocketbaseUrl;
  //   } else {
  //     return _devSocketbaseUrl;
  //   }
  // }

  static const String baseUrl =
      'wss://api-staging.roldrive.com/events'; // 'wss://api.roldrive.com/events';

  // static const String _devSocketbaseUrl =
  //     'wss://api-staging.roldrive.com/events';
}
