import 'package:b2s/utils/routes/routes.dart';
import 'package:b2s/screens/splash_screen.dart';
import 'package:b2s/utils/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      theme: MyTheme.lightTheme(context),
      // darkTheme: MyTheme.darkTheme(context),
      home:  const SplashScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}