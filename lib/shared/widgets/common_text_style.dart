import 'package:flutter/material.dart';

class CTS {
  Text wh1(String text, [double fontSize = 25]) => Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      );

  Text wb(String text, [double fontSize = 20]) => Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      );

  Text bh1(String text, [double fontSize = 25]) => Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      );

  Text bb(String text, [double fontSize = 20]) => Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      );
}
