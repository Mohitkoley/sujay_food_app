import 'package:flutter/material.dart';
import 'package:food_deliver/shared/widgets/common_button.dart';
import 'package:food_deliver/shared/widgets/common_textfield.dart';
import 'package:food_deliver/utils/extensions/util_extensions.dart';

class SignupTabWidget extends StatelessWidget {
  SignupTabWidget({
    super.key,
    required this.phoneController,
    required this.nameController,
  });
  TextEditingController phoneController;
  TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.hBox,
        CommonTextField(
          hintText: "Name",
          controller: nameController,
        ),
        20.hBox,
        CommonTextField(
            hintText: " Phone no",
            controller: phoneController,
            prefix: const Text("+91 ")),
        20.hBox,
        CommonButton(
          text: "Sign-Up",
          onPressed: () {},
        ),
      ],
    );
  }
}
