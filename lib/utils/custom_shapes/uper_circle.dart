import 'package:flutter/material.dart';

class UpperCircle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.4);
    var startingPoint = Offset(size.width * 0.5, size.height);
    var endPoint = Offset(size.width, size.height * 0.4);
    path.quadraticBezierTo(
        startingPoint.dx, startingPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
