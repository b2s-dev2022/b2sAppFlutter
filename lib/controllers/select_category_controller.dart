import 'package:b2s/models/category_model.dart';
import 'package:get/get.dart';

class SelectCategoryController extends GetxController {
  late final List<Categories>? categories;
  RxBool isSelected = false.obs;
  RxInt selectedIndex = (-1).obs;

  final List<String> names = [
    'Accomodation\n& Tourism',
    'Automotive\n& Marine',
    'Building\n& Construction',
    'Beauty, Health\n& Fitness',
    'Educational\n& Training',
    'Franchise',
    'Food, Beverages\n& Hospitality',
    'Home And Gardening',
  ];
  final List<String> catIds = [
    '346',
    '347',
    '349',
    '348',
    '350',
    '352',
    '351',
    '353'
  ];
  final List<String> imagePaths = [
    'assets/icons/category/acc_and_tourism.png',
    'assets/icons/category/automotive_and_marine.png',
    'assets/icons/category/building_and_construction.png',
    'assets/icons/category/bhf.png',
    'assets/icons/category/health_and_education.png',
    'assets/icons/category/franchise.png',
    'assets/icons/category/fbh.png',
    'assets/icons/category/home_and_gardening.png',
  ];

  @override
  void onInit() {
    categories = [];
    super.onInit();
  }

  changeIndex(int index){
    selectedIndex.value = index;
  }

  void clearSelection() {
    selectedIndex.value = -1;
  }

  String getSelectedCatId() {
    if (selectedIndex.value >= 0) {
      return catIds[selectedIndex.value];
    } else {
      return "";
    }
    // return locIds[selectedIndex.value];
  }

  void selectContainer(int index) {
    /// If the container is already selected, deselect it
    if (selectedIndex.value == index) {
      selectedIndex.value = -1;
    } else {
      /// Otherwise, select the container
      selectedIndex.value = index;
    }
  }

}