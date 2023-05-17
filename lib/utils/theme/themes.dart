import 'package:b2s/utils/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      fontFamily: 'Jost',
      cardColor: Colors.white,
      canvasColor: Colors.white,
      // unselectedWidgetColor: MyColors.txtColor,
      // buttonColor: darkBlueishColor,
      // accentColor: darkBlueishColor,
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith(
              (states) => MyColors.txtColor, // Set the desired border color
        ),
        visualDensity: const VisualDensity(vertical: -4),
      ),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Jost',
    cardColor: Colors.black,
    canvasColor: Colors.black,
    // buttonColor: lightBlueishColor,
    // accentColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: Theme.of(context).textTheme.copyWith(
        headline6:
        context.textTheme.titleLarge!.copyWith(color: Colors.white),
      ),
    ),
  );
}