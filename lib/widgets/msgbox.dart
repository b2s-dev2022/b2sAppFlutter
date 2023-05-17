import 'package:b2s/custom_drawings/msg_drawing.dart';
import 'package:b2s/utils/color/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MessageBox extends StatelessWidget {
  final String msg;
  final Color bgColor;
  const MessageBox({
    Key? key,
    required this.msg,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Column(
      children: [
        Container(
          // width: width * 0.7,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: MyColors.txtColor,
                width: 0.5,
              ),
          ),
          child: Text(
            msg,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15
            ),
          ),
        ),
        Transform(
            transform: Matrix4.rotationX(math.pi),
            child: CustomPaint(
              painter: MsgDrawingBox(
                bgColor: Colors.white,
                triangleHeight: 15,
                triangleWidth: 20,
              ),
            ),
        ),
      ],
    );
  }
}
