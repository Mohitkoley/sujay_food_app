import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/features/auth/repository/aut_repository.dart';
import 'package:food_deliver/routes/route_names.dart';
import 'package:food_deliver/utils/extensions/util_extensions.dart';

class AuthController extends ChangeNotifier {
  // text controllers
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();

  // focus nodes
  FocusNode otp1FocusNode = FocusNode();
  FocusNode otp2FocusNode = FocusNode();
  FocusNode otp3FocusNode = FocusNode();
  FocusNode otp4FocusNode = FocusNode();

  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  // resend otp counter
  int resendOtpCounter = 60;

  void otp1Listener(BuildContext context) {
    if (otp1Controller.text.length == 1) {
      FocusScope.of(context).requestFocus(otp2FocusNode);
    } else {
      FocusScope.of(context).unfocus();
    }
  }

  void otp2Listener(BuildContext context) {
    if (otp2Controller.text.length == 1) {
      FocusScope.of(context).requestFocus(otp3FocusNode);
    } else {
      FocusScope.of(context).requestFocus(otp1FocusNode);
    }
  }

  void otp3Listener(BuildContext context) {
    if (otp3Controller.text.length == 1) {
      FocusScope.of(context).requestFocus(otp4FocusNode);
    } else {
      FocusScope.of(context).requestFocus(otp2FocusNode);
    }
  }

  void otp4Listener(BuildContext context) {
    if (otp4Controller.text.length == 1) {
      FocusScope.of(context).unfocus();
    } else {
      FocusScope.of(context).requestFocus(otp3FocusNode);
    }
  }

  void startResendOtpTimer() {
    resendOtpCounter = 60;

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendOtpCounter == 0) {
        timer.cancel();
      } else {
        resendOtpCounter--;
        notifyListeners();
      }
    });
  }

  clearOTPfields() {
    otp1Controller.clear();
    otp2Controller.clear();
    otp3Controller.clear();
    otp4Controller.clear();
  }

  clearfields() {
    phoneController.clear();
    nameController.clear();
  }

  // api calls
  final AuthRepository _repo = AuthRepository();
  String userCountryCode = '+91';
  bool isLoading = false;

  Future<void> sendOtp(BuildContext context) async {
    try {
      Map<String, dynamic> data = {
        "userMobileNo": phoneController.text,
        "userCountryCode": userCountryCode,
      };
      isLoading = true;
      final res = await _repo.sendOTP(data);
      if (res["status"] == "pending" && context.mounted) {
        context.showSnackBar("OTP sent successfully");
        startResendOtpTimer();
        clearOTPfields();
        isLoading = false;
        context.router.pushNamed(RouteNames.otpScreen);
      }
      notifyListeners();
    } catch (e) {
      if (context.mounted) {
        context.showSnackBar(e.toString());
        isLoading = false;
        notifyListeners();
      }
    }
  }

  Future<void> signUp(BuildContext context) async {
    try {
      Map<String, dynamic> data = {
        "userMobileNo": phoneController.text,
        "userCountryCode": userCountryCode,
        "userName": nameController.text,
        "otp": otp1Controller.text +
            otp2Controller.text +
            otp3Controller.text +
            otp4Controller.text,
      };
      isLoading = true;
      final res = await _repo.signUp(data);
      if (res["status"] == "success" && context.mounted) {
        context.showSnackBar("User registered successfully");
        clearfields();
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      if (context.mounted) {
        context.showSnackBar(e.toString());
        isLoading = false;
        notifyListeners();
      }
    }
  }
}
