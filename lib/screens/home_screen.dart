import 'package:b2s/controllers/business_listing_controller.dart';
import 'package:b2s/models/business_listing_model.dart';
import 'package:b2s/utils/color/colors.dart';
import 'package:b2s/utils/routes/routes_name.dart';
import 'package:b2s/widgets/msgbox.dart';
import 'package:b2s/widgets/search_category.dart';
import 'package:b2s/widgets/search_location.dart';
import 'package:b2s/widgets/select_category.dart';
import 'package:b2s/widgets/select_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key,}) : super(key: key);

  final BusinessListingController businessListingCtrl =
      Get.put(BusinessListingController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/dashboard_bg.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            color: Colors.white.withOpacity(0.9),
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        'Your Destination for\nBuying & Selling Businesses',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: MyColors.txtColor,
                          fontSize: 30,
                          // fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 24, 14, 16),
                      child: Column(
                        children: [
                          /// Search Category widget start here
                          SearchCategory(),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// Search Location widget start here
                              SearchLocation(),
                              InkWell(
                                onTap: () async {
                                  SharedPreferences localStorage =
                                      await SharedPreferences.getInstance();
                                  int selectedC = int.parse(localStorage
                                      .getString('selectedC')
                                      .toString());
                                  String selectedL = localStorage
                                      .getString('selectedL')
                                      .toString();
                                  // print({selectedC, selectedL});

                                  var listings = await businessListingCtrl
                                      .getBusinessListings(
                                          selectedC, selectedL);
                                  Get.toNamed(RoutesName.dashboardScreen, arguments: listings);
                                  // Get.toNamed(RoutesName.businessListingScreen,arguments: listings);
                                  // print(listings);
                                },
                                child: Container(
                                  height: height * 0.059,
                                  width: width * 0.2,
                                  decoration: BoxDecoration(
                                    color: MyColors.btnColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(
                                        Boxicons.bx_search,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Search',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height * 0.35,
                      width: width - 30,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        border: Border.all(
                          color: Colors.blue.shade100,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 4, 0, 0),
                            child: Text(
                              'Our New Click Search',
                              style: TextStyle(
                                color: MyColors.txtColor,
                                fontSize: 18,
                                // fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Step1. Select a Location',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                              ),
                            ),
                          ),

                          /// Location GridViewBuilder start here
                          SelectLocation(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Step2. Select a Category',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 12),
                                  child: Text(
                                    'Step3. Go',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// Category GridViewBuilder start here
                          SelectCategory(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: MessageBox(
                          msg:
                              'Business2Sell is one of the biggest and\ntrusted marketplaces for buying and\nselling businesses in Australia.',
                          bgColor: Colors.white,
                        ),
                      ),
                    ),
                    Image(
                      image: const AssetImage(
                        'assets/images/group_141.png',
                      ),
                      height: height * 0.25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
