class ApiEndPoint {
  static const String baseUrl = '192.168.1.13:6001';
  static const String sendOtp = '/api/v1/auth/send-otp';
  static const String signUp = '/api/v1/auth/signup';
}

class SocketEndPoint {
  static const String baseUrl =
      'wss://api-staging.roldrive.com/events'; // 'wss://api.roldrive.com/events';

  // static const String _devSocketbaseUrl =
  //     'wss://api-staging.roldrive.com/events';
}
