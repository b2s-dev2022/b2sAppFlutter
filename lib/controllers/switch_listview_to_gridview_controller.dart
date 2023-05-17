import 'package:get/get.dart';

class ListviewToGridviewController extends GetxController {
  final isListView = true.obs;

  void toggleView() {
    isListView.value = !isListView.value;
    // isListView.toggle();
  }
}
