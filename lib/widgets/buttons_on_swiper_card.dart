import 'package:flutter/material.dart';

class ChoiceButtons extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final Widget child;
  final Function()? onTap;
  const ChoiceButtons({
    Key? key,
    required this.height,
    required this.width,
    required this.color,
    required this.borderRadius,
    required this.borderWidth,
    required this.borderColor,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        child: child,
      ),
    );
  }
}