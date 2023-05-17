import 'package:b2s/screens/favourite_listing_screen.dart';
import 'package:b2s/screens/home_screen.dart';
import 'package:b2s/screens/message_screen.dart';
import 'package:b2s/screens/profile_screen.dart';
import 'package:b2s/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController{
  final selectedIndex = 0.obs;
  final tabSelected = false.obs;

  // List<Widget> screens = [
  //   HomeScreen(),
  //   SearchScreen(),
  //   FavouriteScreen(),
  //   MessageScreen(),
  //   ProfileScreen(),
  // ];

  Widget get selectedTab {
    switch (selectedIndex.value) {
      case 0:
        return  HomeScreen();
      case 1:
        return SearchScreen();
      case 2:
        return FavouriteListingScreen();
        case 3:
        return MessageScreen();
        case 4:
        return MessageScreen();
      default:
        return HomeScreen();
    }
  }

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}