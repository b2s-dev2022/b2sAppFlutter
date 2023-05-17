import 'package:flutter/material.dart';

class CustomRangeSliderThumbShape extends RangeSliderThumbShape {
  static const double _thumbRadius = 13.5;
  static const double _borderWidth = 2.0;
  static final Color _borderColor = Colors.blue.shade700;


  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size.fromRadius(_thumbRadius);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        bool isDiscrete = false,
        bool isEnabled = false,
        bool isOnTop = false,
        TextDirection textDirection = TextDirection.ltr,
        required SliderThemeData sliderTheme,
        Thumb thumb = Thumb.start,
        bool isPressed = false,
      }) {
    final Canvas canvas = context.canvas;

    final Paint borderPaint = Paint()
      ..color = _borderColor
      ..style = PaintingStyle.fill
      ..strokeWidth = _borderWidth;

    final Paint fillPaint = Paint()
      ..color = sliderTheme.thumbColor!
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, _thumbRadius, borderPaint);
    canvas.drawCircle(center, _thumbRadius - _borderWidth, fillPaint);
  }
}

