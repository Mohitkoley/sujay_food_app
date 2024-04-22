import 'package:flutter/services.dart';

mixin CommonValidator {
  String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (value.length < 10) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  List<TextInputFormatter> get phoneNumberFormatter => [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        FilteringTextInputFormatter.digitsOnly,
      ];
}
