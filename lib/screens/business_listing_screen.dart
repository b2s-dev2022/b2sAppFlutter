import 'package:b2s/controllers/drawer_controller.dart';
import 'package:b2s/controllers/favourite_controller.dart';
import 'package:b2s/controllers/switch_listview_to_gridview_controller.dart';
import 'package:b2s/models/business_listing_model.dart';
import 'package:b2s/utils/color/colors.dart';
import 'package:b2s/utils/routes/routes_name.dart';
import 'package:b2s/widgets/businesslisting_in_gridview.dart';
import 'package:b2s/widgets/custom_appbar.dart';
import 'package:b2s/widgets/custom_bottomnavbar.dart';
import 'package:b2s/widgets/drawer.dart';
import 'package:b2s/widgets/search_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusinessListingScreen extends StatelessWidget {
  BusinessListingScreen({Key? key}) : super(key: key);

  final ListviewToGridviewController listviewToGridviewCtrl =
      Get.put(ListviewToGridviewController());

  final MyDrawerController drawerCtrl = Get.put(MyDrawerController());

  final FavouriteListingController favouriteListingCtrl =
      Get.put(FavouriteListingController());

  final BusinessListingModel businessListingModel = Get.arguments;

  // final List<String> savedListingIds = [];
  @override
  Widget build(BuildContext context) {
    print('build');
    print(Get.arguments);
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    int page = 5;
    return Scaffold(
      key: drawerCtrl.scaffoldKey2,
      drawer: MyDrawer(),
      appBar: customAppBar(context, '', page),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SearchCategory(showLogo: false),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // '1552 Business For Sale Melbourne VIC',
                  '${businessListingModel.totallisting} ${businessListingModel.pagetitle}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        listviewToGridviewCtrl.toggleView();
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        // margin: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: MyColors.txtColor,
                            width: 1,
                          ),
                        ),
                        child: Transform.scale(
                          scale: 0.4,
                          child: SvgPicture.asset(
                            'assets/icons/bx-list-ul.svg',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    GestureDetector(
                      onTap: () {
                        listviewToGridviewCtrl.toggleView();
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        // margin: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: MyColors.txtColor,
                            width: 1,
                          ),
                        ),
                        child: Transform.scale(
                          scale: 0.4,
                          child: SvgPicture.asset(
                            'assets/icons/bx-grid-alt.svg',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Obx(
                () => listviewToGridviewCtrl.isListView.value
                    ? ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: businessListingModel.listings!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Container(
                              // height: MediaQuery.of(context).size.height * 0.16,
                              // width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey.shade500,
                                  width: 0.6,
                                ),
                                // boxShadow: const [
                                //   BoxShadow(
                                //     color: Colors.grey,
                                //     offset: Offset(5,5)
                                //   ),
                                // ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 10,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Container(
                                            height: height * 0.15,
                                            width: width * 0.32,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              // borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: Image.network(
                                              '${businessListingModel.listings![index].imageUrl}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: width * 0.26,
                                        top: height * 0.02,
                                        child: GestureDetector(
                                          onTap: () async {
                                            SharedPreferences localStorage =
                                                await SharedPreferences
                                                    .getInstance();
                                            String listingId =
                                                businessListingModel.listings![index].id
                                                    .toString();
                                            // savedListingIds.add(listingId);
                                            if (favouriteListingCtrl
                                                .savedListingIds
                                                .contains(listingId)) {
                                              favouriteListingCtrl
                                                  .removeFromFavourite(
                                                      listingId);
                                            } else {
                                              favouriteListingCtrl
                                                  .addToFavourite(listingId);
                                            }

                                            var savedKey =
                                                localStorage.setString(
                                                    'savedKey',
                                                    favouriteListingCtrl
                                                        .savedListingIds
                                                        .toString());
                                            print('set savedKey');
                                            print(savedKey);
                                            print(favouriteListingCtrl
                                                .savedListingIds);
                                          },
                                          child: CircleAvatar(
                                            radius: 12.0,
                                            backgroundColor: Colors.white,
                                            child: Obx(
                                              () => Icon(
                                                Boxicons.bxs_heart,
                                                color: favouriteListingCtrl
                                                        .savedListingIds
                                                        .contains(
                                                            businessListingModel.listings![
                                                                    index]
                                                                .id
                                                                .toString())
                                                    ? Colors.red
                                                    : Colors.blue,
                                                size: 13,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          constraints: const BoxConstraints(
                                            maxWidth: 190,
                                          ),
                                          child: Text(
                                            // 'Boutique Yarra Valley Winery...',
                                            '${businessListingModel.listings![index].heading1}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          constraints: const BoxConstraints(
                                            maxWidth: 190,
                                          ),
                                          child: Text(
                                            // 'Cottles Bridge, Melbourne, Victoria',
                                            '${businessListingModel.listings![index].location}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Price:',
                                              style: TextStyle(
                                                color: MyColors.btnColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                            Container(
                                              constraints: const BoxConstraints(
                                                maxWidth: 150,
                                              ),
                                              child: Text(
                                                // '\$2,750,000',
                                                '${businessListingModel.listings![index].price}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  color: MyColors.btnColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          constraints: const BoxConstraints(
                                            maxWidth: 190,
                                          ),
                                          child: Text(
                                            // 'Food  >  Manufacturing and Industrial',
                                            '${businessListingModel.listings![index].catename}'
                                            ' > '
                                            '${businessListingModel.listings![index].multicate}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          height: height * 0.04,
                                          width: width * 0.25,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.grey.shade600,
                                              width: 0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                          child: Image.network(
                                            // 'assets/images/food.webp',
                                            '${businessListingModel.listings![index].logo}',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : BusinessListingInGridview(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
