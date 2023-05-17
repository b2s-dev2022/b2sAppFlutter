import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawerController extends GetxController{
  final GlobalKey<ScaffoldState> scaffoldKey1 = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> scaffoldKey2 = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> scaffoldKey3 = GlobalKey<ScaffoldState>();
  // final GlobalKey<ScaffoldState> scaffoldKey4 = GlobalKey<ScaffoldState>();

  final isLoggedIn = false.obs;

  void openDrawer() {
    scaffoldKey1.currentState?.openDrawer();
    scaffoldKey2.currentState?.openDrawer();
    scaffoldKey3.currentState?.openDrawer();
    // scaffoldKey4.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey1.currentState!.openEndDrawer();
    scaffoldKey2.currentState!.openEndDrawer();
    scaffoldKey3.currentState!.openEndDrawer();
    // scaffoldKey4.currentState!.openEndDrawer();
  }


  Future<void> checkBuyerLogin() async {

    // Perform login logic here
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var buyerInfo = localStorage.getString('buyerInfo');

    // Set isAuthenticated to true if login is successful

    if(buyerInfo != null ){
      isLoggedIn.value = true;
    }
    debugPrint('buyerInfo: $buyerInfo');
  }

  Future<void> logout() async {

    // Perform logout logic here
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var rmBuyerInfo = localStorage.remove('buyerInfo');

    // Set isAuthenticated to false if logout is successful
    isLoggedIn.value = false;
    debugPrint('buyerInfo: $rmBuyerInfo');
  }

  @override
  void onInit() {
    checkBuyerLogin();
    super.onInit();
  }

  String get drawerTitle => isLoggedIn.value ? 'Logout' : 'Buyer Register';
  IconData get drawerIcon => isLoggedIn.value ? Icons.logout_outlined : Icons.login_outlined;
}