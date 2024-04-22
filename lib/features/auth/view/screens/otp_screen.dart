import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/features/auth/controller/auth_controller.dart';
import 'package:food_deliver/features/auth/view/components/otp_textfield.dart';
import 'package:food_deliver/routes/route_names.dart';
import 'package:food_deliver/shared/widgets/common_button.dart';
import 'package:food_deliver/utils/extensions/util_extensions.dart';
import 'package:provider/provider.dart';

@RoutePage()
class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Enter OTP"),
          centerTitle: true,
        ),
        body: Consumer<AuthController>(builder: (context, authController, _) {
          return Form(
            key: _formKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                children: [
                  20.wBox,
                  SizedBox(
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OTPTextField(
                            controller: authController.otp1Controller,
                            focusNode: authController.otp1FocusNode,
                            onChanged: (value) {
                              authController.otp1Listener(context);
                            }),
                        20.wBox,
                        OTPTextField(
                            controller: authController.otp2Controller,
                            focusNode: authController.otp2FocusNode,
                            onChanged: (value) {
                              authController.otp2Listener(context);
                            }),
                        20.wBox,
                        OTPTextField(
                            controller: authController.otp3Controller,
                            focusNode: authController.otp3FocusNode,
                            onChanged: (value) {
                              authController.otp3Listener(context);
                            }),
                        20.wBox,
                        OTPTextField(
                            controller: authController.otp4Controller,
                            focusNode: authController.otp4FocusNode,
                            onChanged: (value) {
                              authController.otp4Listener(context);
                            }),
                      ],
                    ),
                  ),
                  if (authController.resendOtpCounter > 0)
                    Text(
                        "Resend OTP in ${authController.resendOtpCounter} seconds")
                  else
                    TextButton(
                      child: const Text("Resend OTP"),
                      onPressed: () {
                        authController.startResendOtpTimer();
                      },
                    ),
                  40.hBox,
                  CommonButton(
                      text: authController.isLoading ? "Loading..." : "Verify",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // authController.verifyOtp(context);
                          context.router.pushNamed(RouteNames.dashBoardScreen);
                        }
                      })
                ],
              ),
            ),
          );
        }));
  }
}
