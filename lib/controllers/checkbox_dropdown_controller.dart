import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpansionTileItem {
  final String name;
  bool checked;
  ExpansionTileItem({required this.name, this.checked = false});
}

class MyCheckboxDropdownController extends GetxController {
  // final searchController  = TextEditingController();
  // final itemsss = <String>[].obs;
  final selectedItems = <String>[].obs;
  final itemssss = <String>['Item 1', 'Item 2', 'Item 3'].obs;
  final customIcon = false.obs;

  // void setSearch(value) {
  //   searchController.text = value;
  //   filteredItems();
  // }

  // void setItems(List<String> newItems) {
  //   itemsss.value = newItems;
  //   filteredItems.value = newItems;
  // }

  void toggleItems(String item) {
    if(selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
  }

  List<String> get filteredItems =>
      itemssss.where((item) => !selectedItems.contains(item)).toList();

  // void filterItems(){
  //   filteredItems.value = items.where((item){
  //     return item.toLowerCase().contains(searchText);
  //   }).toList();
  // }

  final List<ExpansionTileItem> items = [
    ExpansionTileItem(name: 'Item 1'),
    ExpansionTileItem(name: 'Item 2'),
    ExpansionTileItem(name: 'Item 3'),
  ].obs;

  void toggleCheckbox(int index) {
    items[index].checked = !items[index].checked;
    update();
  }

  final _isChecked = false.obs;
  bool get isChecked => _isChecked.value;
  set isChecked(bool val) => _isChecked.value = val;

  final _selectedValue = 'Option 1'.obs;
  String get selectedValue => _selectedValue.value;
  set selectedValue(String val) => _selectedValue.value = val;

  final isPopupOpen = false.obs;

  void togglePopup() {
    isPopupOpen.toggle();
  }
  void handleDropdownChange(String? value) {
    _selectedValue.value = value ?? dropdownValues[0];
  }

  final List<String> dropdownValues = [
    'Option 1',
    'Option 2',
    'Option 3',
  ];
}