import 'dart:async';

import 'package:b2s/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () => Get.toNamed(
          RoutesName.getStartedScreen,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/b2s_bg.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            color: Colors.white.withOpacity(0.7),
            height: double.infinity,
            width: double.infinity,
          ),
          Center(
            child: Image.asset(
              'assets/images/b2s-icon-small.png',
            ),
          ),
        ],
      ),
    );
  }
}
