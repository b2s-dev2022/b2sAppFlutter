import 'package:get/get.dart';

class PrivateSellerRegistrationController extends GetxController {
  final selectedValue = 1.obs;

  void setOption(val) {
    selectedValue.value = val;
  }
}
