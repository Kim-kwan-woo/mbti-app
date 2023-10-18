import 'package:flutter/material.dart';

class RoundCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    double curveHeight = 50.0; // 곡선 높이 조절
    double width = size.width;
    double height = size.height;

    Path path = Path()
      ..moveTo(0, height)
      ..lineTo(0, curveHeight)
      ..quadraticBezierTo(width / 2, 0, width, curveHeight)
      ..lineTo(width, height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
