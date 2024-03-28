import 'package:flutter/material.dart';

class FoodController extends ChangeNotifier {
  int _foodCounter = 1;

  int get counter => _foodCounter;

  void increment() {
    _foodCounter++;
    notifyListeners();
  }

  void decrement() {
    if (_foodCounter > 1) {
      _foodCounter--;
      notifyListeners();
    }
  }
}
