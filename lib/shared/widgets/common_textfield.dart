import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  CommonTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.prefix});
  final String hintText;
  final TextEditingController controller;
  Widget? prefix;
  TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          // prefix: prefix,
          prefixIcon: prefix,
          //give space between a prefix icon and text field

          prefixIconConstraints:
              const BoxConstraints(minWidth: 40, minHeight: 10),
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 30)),
    );
  }
}
