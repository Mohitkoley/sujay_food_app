import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier {
  static final AppTheme _instance = AppTheme._internal();

  factory AppTheme() {
    return _instance;
  }

  AppTheme._internal();

  ThemeData get lightTheme {
    return ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        textTheme: TextTheme(
          displayLarge: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
        ));
  }

  ThemeData get darkTheme {
    return ThemeData.dark()
        .copyWith(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red));
  }
}
