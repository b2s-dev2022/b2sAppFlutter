import 'package:b2s/controllers/search_location_controller.dart';
import 'package:b2s/controllers/select_location_controller.dart';
import 'package:b2s/utils/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/location_model.dart';

class SelectLocation extends StatelessWidget {
  final SelectLocationController selectLocationCtrl =
      Get.put(SelectLocationController());
  final SearchLocationController searchLocationCtrl =
      Get.put(SearchLocationController());

  SelectLocation({
    Key? key,
    this.locations,
  }) : super(key: key);

  final List<Locations>? locations;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return SizedBox(
      height: height * 0.12,
      // height: 105,
      child: GridView.builder(
        padding: const EdgeInsets.only(left: 10, bottom: 18, top: 6),
        scrollDirection: Axis.horizontal,
        itemCount: selectLocationCtrl.names.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              // selectLocationCtrl.isSelected.value = !selectLocationCtrl.isSelected.value;
              // selectLocationCtrl.changeIndex(index);

              //   /// If the container is already selected, deselect it
              // if (selectLocationCtrl.selectedIndex.value == index) {
              //   selectLocationCtrl.selectedIndex.value = -1;
              // } else {
              //   /// Otherwise, select the container
              //   selectLocationCtrl.selectedIndex.value = index;
              // }

              selectLocationCtrl.selectContainer(index);
              String selectedLocId = selectLocationCtrl.getSelectedLocId();
              print(selectedLocId);
            },
            child: Obx(
              () => Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selectLocationCtrl.selectedIndex.value == index
                        ? Colors.transparent
                        : Colors.blue.shade100,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: selectLocationCtrl.selectedIndex.value == index
                      ? MyColors.btnColor
                      : Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      // color: Color(0xFFe8e8e8),
                      color: Color(0xFFe6e6e6),
                      // color: Color(0xFFcccccc),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      selectLocationCtrl.imagePaths[index],
                      color: selectLocationCtrl.selectedIndex.value == index
                          ? Colors.white
                          : null,
                      height: height * 0.06,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      selectLocationCtrl.names[index],
                      style: TextStyle(
                        fontSize: 10,
                        // fontWeight: FontWeight.bold,
                        color: selectLocationCtrl.selectedIndex.value == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
