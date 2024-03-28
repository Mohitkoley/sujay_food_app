import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  TextEditingController fullNameController =
      TextEditingController(text: 'John Doe');

  void fillProfileController(String fullName) {
    fullNameController.text = fullName;
  }
}
