import 'package:b2s/utils/color/colors.dart';
import 'package:b2s/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex:0,
            child: Transform.scale(
              scale: 1.1,
              child: Image.asset(
                  'assets/images/Group 225.png',
              ),
            ),
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'YOUR DESTINATION FOR\nBUYING & SELLING BUSINESSES',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: MyColors.txtColor,
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                child: Text(
                  'Make your entrepreneurial dream come true by finding the best businesses for sale or close a lucrative deal by selling your business online\nwithout any hassles.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: width * 0.6,
                // width: 203,
                // height: 60,
                height: height * 0.08,
                decoration: BoxDecoration(
                  color: MyColors.btnColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          // fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Container(
                      // height: 50,
                      // width: 50,
                      height: height * 0.064,
                      width: width * 0.14,
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                        onTap: () {
                          print('tapped on getStarted');
                          Get.toNamed(
                            RoutesName.homeScreen,
                          );
                        },
                        child: const Icon(
                          Boxicons.bxs_right_arrow_alt,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
