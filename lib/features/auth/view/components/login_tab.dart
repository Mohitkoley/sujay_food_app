import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/features/auth/controller/auth_controller.dart';
import 'package:food_deliver/features/auth/view/screens/otp_screen.dart';
import 'package:food_deliver/routes/route_names.dart';
import 'package:food_deliver/shared/widgets/common_button.dart';
import 'package:food_deliver/shared/widgets/common_textfield.dart';
import 'package:food_deliver/utils/extensions/util_extensions.dart';
import 'package:provider/provider.dart';

class LoginTabWidget extends StatelessWidget {
  const LoginTabWidget({
    super.key,
    required this.phoneController,
    required this.authController,
  });

  final TextEditingController phoneController;
  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.hBox,
        CommonTextField(
            hintText: " Phone no",
            controller: phoneController,
            prefix: const Text("+91 ")),
        20.hBox,
        CommonButton(
          text: authController.isLoading ? "Loading..." : "Login",
          onPressed: () => login(context),
        ),
      ],
    );
  }

  void login(BuildContext context) {
    authController.sendOtp(context);
  }
}
