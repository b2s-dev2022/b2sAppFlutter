import 'package:b2s/controllers/bnavbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  // final BottomNavBarController bottomCtrl =  Get.put(BottomNavBarController());

   const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text('Search here'),
          )
        ],
      )
    );
  }
}
