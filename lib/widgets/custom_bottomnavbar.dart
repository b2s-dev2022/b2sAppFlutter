import 'dart:convert';

import 'package:b2s/controllers/favourite_controller.dart';
import 'package:b2s/controllers/select_category_controller.dart';
import 'package:b2s/controllers/select_location_controller.dart';
import 'package:b2s/models/business_listing_model.dart';
import 'package:b2s/utils/routes/routes_name.dart';
import 'package:b2s/widgets/search_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/filter_category_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final SelectLocationController selectLocationCtrl =
      Get.put(SelectLocationController());
  final SelectCategoryController selectCategoryCtrl =
      Get.put(SelectCategoryController());
  final FavouriteListingController favouriteListingCtrl =
      Get.put(FavouriteListingController());
  CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.grey.shade200,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 5,
              child: TextButton(
                // style: TextButton.styleFrom(
                //   backgroundColor: Colors.transparent,
                // ),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (states) => Colors.transparent,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child:
                          // Transform.scale(
                          //   scale: 0.3,
                          //   child: SvgPicture.asset(
                          //       'assets/icons/bx-home.svg',
                          //   ),
                          // ),
                          Icon(
                        Boxicons.bx_home,
                        // color: MyColors.btnColor,
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                    Text(
                      "Home",
                      textScaleFactor: 0.8,
                      style: TextStyle(
                        // color: MyColors.btnColor,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
                onPressed: () {
                  selectLocationCtrl.clearSelection();
                  selectCategoryCtrl.clearSelection();
                  Get.back();
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 5,
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (states) => Colors.transparent,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child:
                          // Transform.scale(
                          //   scale: 0.3,
                          //   child: SvgPicture.asset(
                          //     'assets/icons/bx-search.svg',
                          //   ),
                          // ),
                          Icon(
                        Boxicons.bx_search,
                        // color: MyColors.btnColor,
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                    Text(
                      "Search",
                      textScaleFactor: 0.8,
                      style: TextStyle(
                        // color: MyColors.btnColor,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
                onPressed: () async {
                  SharedPreferences localStorage =
                      await SharedPreferences.getInstance();
                  var getFilterCategory = localStorage.getString('filterCat');

                  // Get.put(FilterCategoryController()).setFilterCategory(getFilterCategory ?? '');
                  /*if (getFilterCategory != null){
                    var filterCategoryData = jsonDecode(getFilterCategory);
                    var filterCategories = Filtercategories(
                      catName: filterCategoryData['catName'],
                      catid: filterCategoryData['catid'],
                      caturl: filterCategoryData['caturl'],
                      subCat: filterCategoryData['subCat'],
                    );
                  }*/
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8, // Set the desired height
                        child: SearchBottomSheet(
                          filterCategory: getFilterCategory ?? '',
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 5,
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (states) => Colors.transparent,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child:
                          // Transform.scale(
                          //   scale: 0.3,
                          //   child: SvgPicture.asset(
                          //     'assets/icons/bx-heart.svg',
                          //   ),
                          // ),
                          Icon(
                        Boxicons.bx_heart,
                        // color: MyColors.btnColor,
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                    Text(
                      "Favourite",
                      textScaleFactor: 0.8,
                      style: TextStyle(
                        // color: MyColors.btnColor,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
                onPressed: () async {
                  SharedPreferences localStorage =
                      await SharedPreferences.getInstance();
                  String getSavedListingIds =
                      localStorage.getString('savedKey').toString();

                  /*if (getSavedListingIds != null) {
                    var favListings = await favouriteListingCtrl.getFavouriteListing(getSavedListingIds);
                    print('get savedKey');
                    print(getSavedListingIds);
                    Get.toNamed(RoutesName.favouriteListingScreen, arguments: favListings);
                  } else {
                    print('savedKey is null');
                  }*/

                  print(getSavedListingIds);

                  var favListings = await favouriteListingCtrl
                      .getFavouriteListing(getSavedListingIds);
                  print('get savedKey');
                  // print(favListings);
                  Get.toNamed(RoutesName.favouriteListingScreen,
                      arguments: favListings);
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 5,
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (states) => Colors.transparent,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child:
                          // Transform.scale(
                          //   scale: 0.3,
                          //   child: SvgPicture.asset(
                          //       'assets/icons/bx-home.svg',
                          //   ),
                          // ),
                          Icon(
                        Boxicons.bx_message_square_detail,
                        // color: MyColors.btnColor,
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                    Text(
                      "Message",
                      textScaleFactor: 0.8,
                      style: TextStyle(
                        // color: MyColors.btnColor,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 5,
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (states) => Colors.transparent,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Icon(
                        Boxicons.bx_user,
                        // color: MyColors.btnColor,
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                    Text(
                      "Profile",
                      textScaleFactor: 0.8,
                      style: TextStyle(
                        // color: MyColors.btnColor,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:b2s/controllers/bnavbar_controller.dart';
// import 'package:b2s/controllers/home_controller.dart';
// import 'package:b2s/screens/home_screen.dart.bak';
// import 'package:b2s/utils/color/colors.dart';
// import 'package:b2s/screens/favourite_listing_screen.dart';
// import 'package:b2s/screens/home_screen.dart';
// import 'package:b2s/screens/message_screen.dart';
// import 'package:b2s/screens/profile_screen.dart';
// import 'package:b2s/screens/search_screen.dart';
// import 'package:b2s/utils/routes/routes_name.dart';
// import 'package:b2s/widgets/swiper_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_boxicons/flutter_boxicons.dart';
// import 'package:get/get.dart';
//
// class MyBottomNvgBar extends StatelessWidget {
//   final BottomNavBarController bottomNavCtrl =
//       Get.put(BottomNavBarController());
//   MyBottomNvgBar({
//     super.key,
//   });
//
//   // final List<Widget> screens = const [
//   //   HomeScreen(),
//   //   SearchScreen(),
//   //   FavouriteScreen(),
//   //   MessageScreen(),
//   //   ProfileScreen(),
//   // ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: Obx(
//       //   () => IndexedStack(
//       //     index: bottomNavCtrl.selectedIndex.value,
//       //     children: screens,
//       //   ),
//       // ),
//       // bottomNavigationBar: BottomNavigationBar(
//       //     backgroundColor: Colors.grey.shade200,
//       //     unselectedItemColor: Colors.black,
//       //     selectedItemColor: !bottomNavCtrl.tabSelected.value == true ? MyColors.btnColor : Colors.black,
//       //     type: BottomNavigationBarType.fixed,
//       //     currentIndex: bottomNavCtrl.selectedIndex.value,
//       //     onTap: (index) {
//       //       bottomNavCtrl.selectedTab;
//       //     },
//       //     items:  [
//       //       BottomNavigationBarItem(
//       //         icon: InkWell(
//       //           onTap: () {
//       //             Get.toNamed(RoutesName.homeScreen);
//       //           },
//       //             child: Icon(Icons.home)),
//       //         label: 'Home',
//       //       ),
//       //       BottomNavigationBarItem(
//       //         icon: InkWell(
//       //             onTap: () {
//       //               // Get.toNamed(RoutesName.homeScreen);
//       //             },
//       //             child: Icon(Icons.search)),
//       //         label: 'Search',
//       //       ),
//       //       BottomNavigationBarItem(
//       //         icon: InkWell(
//       //             onTap: () {
//       //               // Get.toNamed(RoutesName.homeScreen);
//       //             },
//       //             child: Icon(Icons.favorite_border_outlined)),
//       //         label: 'Favourite',
//       //       ),
//       //       BottomNavigationBarItem(
//       //         icon: InkWell(
//       //             onTap: () {
//       //               // Get.toNamed(RoutesName.homeScreen);
//       //             },
//       //             child: Icon(Icons.message_outlined)),
//       //         label: 'Message',
//       //       ),
//       //       BottomNavigationBarItem(
//       //         icon: InkWell(
//       //             onTap: () {
//       //               // Get.toNamed(RoutesName.homeScreen);
//       //             },
//       //             child: Icon(Icons.person_outline)),
//       //         label: 'Profile',
//       //       ),
//       //     ],
//       //   ),
//
//     );
//   }
//
//   // _bottomNavBarItems(Icon icon, String label, VoidCallback onTap) {
//   //   return BottomNavigationBarItem(
//   //     icon: InkWell(
//   //       onTap: onTap,
//   //       child: icon,
//   //     ),
//   //     label: label,
//   //   );
//   // }
// }
