import 'package:b2s/controllers/bnavbar_controller.dart';
import 'package:b2s/controllers/home_controller.dart';
import 'package:b2s/controllers/bottom_search_controller.dart';
import 'package:get/get.dart';

class BottomBarItemsBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BottomNavBarController>(() => BottomNavBarController());
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
    Get.lazyPut<BottomSearchScreenController>(() => BottomSearchScreenController());
  }
  
}