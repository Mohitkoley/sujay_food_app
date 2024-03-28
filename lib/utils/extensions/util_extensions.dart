import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;

  //navigation
  NavigatorState get nav => Navigator.of(this);

  //snackbar
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: message.text));
  }
}

extension NumExt on num {
  SizedBox get hBox => SizedBox(height: toDouble());
  SizedBox get wBox => SizedBox(width: toDouble());
}

extension StringExt on String {
  Text get text => Text(this);
  Text get whiteText => Text(this, style: const TextStyle(color: Colors.white));
}

extension TextExt on Text {
  TextStyle get textStyle => style!;

  Text get bold =>
      Text(data!, style: const TextStyle(fontWeight: FontWeight.bold));

  size(double textSize) {
    return (data!, style: TextStyle(fontSize: textSize));
  }
}
