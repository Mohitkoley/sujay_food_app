import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPTextField extends StatelessWidget {
  OTPTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });
  final TextEditingController controller;
  final FocusNode focusNode;
  void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: TextFormField(
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.number,
        focusNode: focusNode,
        onTapOutside: (value) {
          focusNode.unfocus();
        },
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          }
          return null;
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.black),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red), // Red border on error
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey), // Optional: Gray border normally
          ),
          errorStyle: const TextStyle(color: Colors.transparent),
          filled: true,
          fillColor: Colors.white,
          constraints: const BoxConstraints(minHeight: 60, minWidth: 60),
          contentPadding: const EdgeInsets.only(bottom: 5),
          hintText: '',
          hintStyle: const TextStyle(color: Colors.transparent),
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}
