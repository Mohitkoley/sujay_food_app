import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  CommonTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.inputFormatters = const [],
      this.validator,
      this.prefix});
  final String hintText;
  final TextEditingController controller;
  Widget? prefix;
  TextInputType keyboardType;
  List<TextInputFormatter> inputFormatters;
  String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: validator,
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
