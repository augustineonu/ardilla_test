import 'dart:math';

import 'package:flutter/material.dart';

class SpotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      // ..color = const Color(0xff550988)
      ..color = Colors.red // Set the color of the spots here
      ..style = PaintingStyle.fill;

    final random = Random();

    for (double x = 0; x < size.width; x += random.nextDouble() * 20) {
      for (double y = 0; y < size.height; y += random.nextDouble() * 20) {
        if (random.nextDouble() < 0.7) {
          final spotSize = random.nextDouble() * 1 +
              0.5; // Randomize spot size between 1 and 4
          canvas.drawRect(
            Rect.fromLTWH(x, y, spotSize, spotSize),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Since the spots are static, there's no need to repaint
  }
}
