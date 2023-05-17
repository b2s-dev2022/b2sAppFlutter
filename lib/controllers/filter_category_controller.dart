import 'package:get/get.dart';

class FilterCategoryController extends GetxController{
  var filterCategory = ''.obs;

  void setFilterCategory(String category) {
    filterCategory.value = category;
  }
}