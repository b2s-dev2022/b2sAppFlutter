import 'dart:convert';
import 'package:b2s/models/category_model.dart';
import 'package:b2s/utils/api_services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SearchCategoryController extends GetxController {
  final txtEditingCtrl = TextEditingController().obs;
  final focusNode = FocusNode().obs;

  @override
  void dispose() {
    txtEditingCtrl.value.dispose();
    focusNode.value.dispose();
    super.dispose();
  }

  int catid = 1;
  String name = '';

  Future<CategoryModel>? _futureCategories;
  Categories? _selectedCategory;

  // void updateText(String newText) {
  //   txtEditingCtrl.text = newText;
  // }

  // String getText() {
  // return txtEditingCtrl.text;
  // }

  // @override
  // void onInit() {
  //   super.onInit();
  //   txtEditingCtrl.value = TextEditingController();
  // }

  @override
  void onClose() {
    // Dispose of the controllers when the controller is closed
    txtEditingCtrl.close();
    super.onClose();
  }

  void onSelected(suggestion) {
    /// Update the text field value with the selected category name
    // _selectedCategory.value = categories.name;
    // txtEditingCtrl.value = suggestion;
  }

  Future<List<Categories>> getCategories(String query) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // int term = int.parse(localStorage.getString('term').toString());
    ApiService apiService = ApiService();
    http.Response response = await apiService.getData(
      '/typeHint/categories',
      {'term': query},
    );
    // print(response.body.toString());
    final data = jsonDecode(response.body.toString());

    print("-------- getCategories --------");
    print(data);
    print("-------- getCategories --------");

    if (response.statusCode == 200) {
      // var categories = data['categories'];
      // var catNam = [];
      // for (var category in categories) {
      //   catNam.add(category['name']);
      // }
      // return catNam;

      // return data.categories?.where((category) {
      //   return category.name?.toLowerCase().contains(query.toLowerCase()) ?? false;
      // }).toList() ?? [];

      /// Create a CategoryModel object from the JSON map
      final categoryName = CategoryModel.fromJson(data);

      /// Access the 'categories' property of the CategoryModel object
      List<Categories> categories = categoryName.categories ?? [];

      /// Filter categories based on name
      categories = categories
          .where((category) =>
              category.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();

      return categories;
    } else {
      throw Exception('Failed to fetch categories');
    }
  }
}
