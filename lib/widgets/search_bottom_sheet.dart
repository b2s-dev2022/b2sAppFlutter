import 'package:b2s/controllers/checkbox_dropdown_controller.dart';
import 'package:b2s/controllers/investment_slider_controller.dart';
import 'package:b2s/controllers/search_location_controller.dart';
import 'package:b2s/models/business_listing_model.dart';
import 'package:b2s/utils/color/colors.dart';
import 'package:b2s/utils/routes/routes_name.dart';
import 'package:b2s/widgets/custom_rangeslider_thumb.dart';
import 'package:b2s/widgets/search_location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/filter_category_controller.dart';

class SearchBottomSheet extends StatelessWidget {
  final String filterCategory;
  final InvestmentController investmentCtrl = Get.put(InvestmentController());
  final MyCheckboxDropdownController myCheckboxDropdownCtrl =
      Get.put(MyCheckboxDropdownController());
  final SearchLocationController searchLocationCtrl =
      Get.put(SearchLocationController());

  SearchBottomSheet({Key? key,
    required this.filterCategory
  }) : super(key: key);

  final List<Map<String, dynamic>> expansionData = [

    {
      'title': 'Accommodation & Tourism',
      'items': ['Item 0', 'Item 1', 'Item 2'],
    },
    {
      'title': 'Automotive & Marine',
      'items': ['Item 3', 'Item 4', 'Item 5','Item 5','Item 5'],
    },
    {
      'title': 'Beauty, Health & Fitness',
      'items': ['Item 6', 'Item 7', 'Item 8'],
    },
    {
      'title': 'Building & Construction',
      'items': ['Item 9', 'Item 10', 'Item 11'],
    },
    {
      'title': 'Educational & Training',
      'items': ['Item 12', 'Item 13', 'Item 14'],
    },
    {
      'title': 'Food, Beverages & Hospitality',
      'items': ['Item 15', 'Item 16', 'Item 17'],
    },
    {
      'title': 'Franchise',
      'items': ['Item 18', 'Item 19', 'Item 20'],
    },
    {
      'title': 'Home And Gardening',
      'items': ['Item 21', 'Item 22', 'Item 23'],
    },
  ];

  // final FilterCategoryController filterCtrl = Get.put(FilterCategoryController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Container(
      // height: height,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.close,
                  ),
                  onPressed: () => Get.back(),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Filter',
                  style: TextStyle(
                    color: MyColors.txtColor,
                    // color: Colors.blue,
                    fontFamily: 'Jost',
                    fontSize: 24,
                  ),
                ),
                Container(
                  height: height * 0.05,
                  width: width * 0.22,
                  decoration: BoxDecoration(
                      color: MyColors.btnColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Jost',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const Text(
              'Location',
              style: TextStyle(
                color: MyColors.txtColor,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            SearchLocation(
              showLogo: false,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Investment',
                  style: TextStyle(
                    color: MyColors.txtColor,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '\$2300 - \$50,000',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.9,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 4,
                      // Set the color of the thumbs
                      thumbColor: Colors.white,
                      // Set the color of the active track
                      activeTrackColor: Colors.blue.shade700,
                      // Set the color of the inactive track
                      inactiveTrackColor: Colors.blue.shade100,
                      // Set the color of the overlay when dragging thumbs
                      overlayColor: Colors.blue.withAlpha(32),
                      minThumbSeparation: 50,
                      rangeThumbShape: CustomRangeSliderThumbShape(),

                      // const RoundRangeSliderThumbShape(
                      //   enabledThumbRadius: 12,
                      // ),
                    ),
                    child: Obx(
                      () => RangeSlider(
                        // activeColor: Colors.white,
                        values: investmentCtrl.rangeValues.value,
                        min: 0.0,
                        max: 100.0,
                        // divisions: 10,
                        labels: RangeLabels(
                          investmentCtrl.rangeValues.value.start
                              .round()
                              .toString(),
                          investmentCtrl.rangeValues.value.end
                              .round()
                              .toString(),
                        ),
                        onChanged: (val) {
                          investmentCtrl.updateRangeValues(val);
                          // print(val);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              'Business Categories',
              style: TextStyle(
                color: MyColors.txtColor,
                fontSize: 20,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: expansionData.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> data = expansionData[index];
                          String title = data['title'];
                          List<String> items = data['items'];
                          return ExpansionTile(
                            tilePadding: const EdgeInsets.symmetric(horizontal: 0),
                            // expandedCrossAxisAlignment: CrossAxisAlignment.end,
                            // expandedAlignment: Alignment.bottomLeft,
                            leading: Obx(
                              () => Transform.scale(
                                scale: 1.1,
                                child: Checkbox(
                                  side: BorderSide(
                                    color: Colors.blue.shade300,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  value: myCheckboxDropdownCtrl.isChecked,
                                  onChanged: (value) {
                                    myCheckboxDropdownCtrl.isChecked =
                                        value ?? false;
                                  },
                                ),
                              ),
                            ),
                            trailing: const Icon(
                              Icons.keyboard_arrow_down,
                              size: 19,
                              color: Colors.black,
                            ),
                            onExpansionChanged: (bool expanded) {
                              // _customIcon = expanded;
                            },
                            title: Text(
                              // 'Accommodation & Tourism',
                              title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            // clipBehavior: Clip.antiAlias,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: Column(
                                  children: [
                                    ListView.builder(
                                      // scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      // itemCount: myCheckboxDropdownCtrl.filteredItems.length,
                                      itemCount: items.length,
                                      itemBuilder: (context, index) {
                                        // String item = myCheckboxDropdownCtrl.filteredItems[index];
                                        String item = items[index];
                                        bool isSelected = myCheckboxDropdownCtrl
                                            .selectedItems
                                            .contains(item);
                                        return Transform.scale(
                                          scale: 1.1,
                                          child: CheckboxListTile(
                                            side: BorderSide(
                                              color: Colors.blue.shade300,
                                            ),
                                            checkboxShape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            dense: true,
                                            contentPadding:
                                                const EdgeInsets.only(left: 5),
                                            title: Text(item),
                                            value: isSelected,
                                            onChanged: (value) =>
                                                myCheckboxDropdownCtrl.isChecked =
                                                    value ?? false,
                                            // onChanged: (value) => myCheckboxDropdownCtrl.toggleItems,
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        );
                                      },
                                    ),

                                    // DropdownButtonHideUnderline(
                                    //   child: DropdownButton(
                                    //     icon: const Icon(
                                    //       Icons.keyboard_arrow_down,
                                    //       size: 19,
                                    //       color: Colors.black,
                                    //     ),
                                    //     items: myCheckboxDropdownCtrl.dropdownValues
                                    //         .map(
                                    //           (value) => DropdownMenuItem(
                                    //             value: value,
                                    //             child: Text(value),
                                    //           ),
                                    //         )
                                    //         .toList(),
                                    //     onChanged: (value) {
                                    //       myCheckboxDropdownCtrl.selectedValue =
                                    //           value.toString();
                                    //     },
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13, right: 6),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesName.businessListingScreen);
                      },
                      child: Container(
                        // width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: MyColors.btnColor),
                        child: const Center(
                          child: Text(
                            'Show Properties',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
