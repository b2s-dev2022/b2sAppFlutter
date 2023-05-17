import 'package:b2s/models/location_model.dart';
import 'package:get/get.dart';

class SelectLocationController extends GetxController{
  LocationModel? _locationModel;
  late final List<Locations>? locations;
  RxBool isSelected = false.obs;
  RxInt selectedIndex = (-1).obs;

  final List<String> names = [
    'Melbourne',
    'Sydney',
    'Brisbane',
    'Goldcoast',
    'Sunshine Coast',
    'Adelaide',
    'Perth',
    'Canberra',
    'Hobart',
    'Darwin',
  ];
  final List<String> locIds = [
    'vic/melbourne',
    'nsw/sydney',
    'qld/brisbane',
    'qld/gold-coast',
    'qld/sunshine-coast',
    'sa/adelaide',
    'wa/perth',
    'act/canberra',
    'tas/hobart',
    'nt',
  ];
  final List<String> imagePaths = [
    'assets/icons/location/m.png',
    'assets/icons/location/sidney.png',
    'assets/icons/location/brisbane.png',
    'assets/icons/location/goldcoast.png',
    'assets/icons/location/m.png',
    'assets/icons/location/adilade.png',
    'assets/icons/location/perth.png',
    'assets/icons/location/canberra.png',
    'assets/icons/location/hobart.png',
    'assets/icons/location/darwin.png',
  ];

  @override
  void onInit() {
    locations = [];
    super.onInit();
  }

   changeIndex(int index){
    selectedIndex.value = index;
  }

  void clearSelection() {
    selectedIndex.value = -1;
  }

  String getSelectedLocId() {
    if (selectedIndex.value >= 0) {
      return locIds[selectedIndex.value];
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
    // if (selectedIndex.value >= 0) {
    //   final selectedLocation = locations![selectedIndex.value];
    //   final locId = selectedLocation.locid;
    //   print(locId);
    // }
  }
}