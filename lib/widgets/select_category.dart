import 'package:b2s/controllers/business_listing_controller.dart';
import 'package:b2s/controllers/search_category_controller.dart';
import 'package:b2s/controllers/select_category_controller.dart';
import 'package:b2s/controllers/select_location_controller.dart';
import 'package:b2s/utils/color/colors.dart';
import 'package:b2s/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectCategory extends StatelessWidget {
  final SelectCategoryController selectCategoryCtrl =
      Get.put(SelectCategoryController());
  final SelectLocationController selectLocationCtrl =
      Get.put(SelectLocationController());
  final BusinessListingController businessListingCtrl =
      Get.put(BusinessListingController());

  SelectCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: height * 0.12,
          // color: Colors.blue,
          // height: 105,
          width: width / 1.45,
          child: GridView.builder(
              padding: const EdgeInsets.only(left: 10, bottom: 18, top: 6),
              scrollDirection: Axis.horizontal,
              itemCount: selectCategoryCtrl.names.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    selectCategoryCtrl.selectContainer(index);
                    String selectedCatId =
                        selectCategoryCtrl.getSelectedCatId();
                    print(selectedCatId);
                  },
                  child: Obx(
                    () => Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectCategoryCtrl.selectedIndex.value == index
                              ? Colors.transparent
                              : Colors.blue.shade100,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: selectCategoryCtrl.selectedIndex.value == index
                            ? MyColors.btnColor
                            : Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            // color: Color(0xFFe8e8e8),
                            color: Color(0xFFe6e6e6),
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
                            selectCategoryCtrl.imagePaths[index],
                            height: height * 0.05,
                            color:
                                selectCategoryCtrl.selectedIndex.value == index
                                    ? Colors.white
                                    : MyColors.txtColor,
                            fit: BoxFit.cover,
                          ),
                          Center(
                            child: Text(
                              selectCategoryCtrl.names[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 9,
                                // fontWeight: FontWeight.bold,
                                color: selectCategoryCtrl.selectedIndex.value ==
                                        index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
            right: 10,
          ),
          child: Container(
            height: height * 0.09,
            width: width * 0.19,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MyColors.btnColor,
            ),
            child: TextButton(
              onPressed: () async {
                String selectedLocId = selectLocationCtrl.getSelectedLocId();
                int selectedCatId =
                    int.parse(selectCategoryCtrl.getSelectedCatId().toString());
                print(
                    'Selected LocId: $selectedLocId\nSelected CatId: $selectedCatId');

                var listings = await businessListingCtrl.getBusinessListings(
                    selectedCatId, selectedLocId);
                print('tapped on GO');
                Get.toNamed(RoutesName.dashboardScreen, arguments: listings);
              },
              child: const Text(
                'Go',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
