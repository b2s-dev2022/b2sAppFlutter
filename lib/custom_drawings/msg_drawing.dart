import 'package:b2s/utils/color/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MsgDrawingBox extends CustomPainter {
  final Color bgColor;
  final double triangleHeight;
  final double triangleWidth;

  MsgDrawingBox({
    required this.bgColor,
    required this.triangleHeight,
    required this.triangleWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = bgColor
      ..strokeWidth = 0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = MyColors.txtColor // Border color
      ..strokeWidth = 1 // Border width
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(-70, size.height);
    path.lineTo(size.width - triangleWidth -50, size.height - 22);
    path.lineTo(size.width - 50, triangleHeight - 15);
    path.close();

    // Draw the left border
    borderPaint.color = MyColors.txtColor;
    canvas.drawPath(
      Path()
        ..moveTo(path.getBounds().left, path.getBounds().bottom)
        ..lineTo(path.getBounds().left, path.getBounds().top)
        ..close(),
      borderPaint,
    );

    // Draw the right border
    borderPaint.color = MyColors.txtColor;
    canvas.drawPath(
      Path()
        ..moveTo(path.getBounds().left, path.getBounds().top)
        ..lineTo(path.getBounds().right, path.getBounds().bottom)
        ..close(),
      borderPaint,
    );
    // Draw the bottom border 2 times
    borderPaint.color = Colors.white;
    canvas.drawPath(
    Path()
    ..moveTo(path.getBounds().left, path.getBounds().bottom)
    ..lineTo(path.getBounds().right, path.getBounds().bottom)
    ..close(),
    borderPaint,
    );
    borderPaint.color = Colors.white;
    canvas.drawPath(
    Path()
    ..moveTo(path.getBounds().left, path.getBounds().bottom)
    ..lineTo(path.getBounds().right, path.getBounds().bottom)
    ..close(),
    borderPaint,
    );
    // Draw the bottom border 2 times
    // Draw the filled triangle
    canvas.drawPath(path, paint);
    // canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

