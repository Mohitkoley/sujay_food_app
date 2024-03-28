import 'dart:async';

import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  // text controllers
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();

  // focus nodes
  FocusNode otp1FocusNode = FocusNode();
  FocusNode otp2FocusNode = FocusNode();
  FocusNode otp3FocusNode = FocusNode();
  FocusNode otp4FocusNode = FocusNode();

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
}
