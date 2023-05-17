import 'package:b2s/controllers/listing_detail_controller.dart';
import 'package:b2s/models/favourite_listing_model.dart';
import 'package:b2s/widgets/buttons_on_swiper_card.dart';
import 'package:b2s/widgets/no_favourite_listing.dart';
import 'package:flutter/material.dart';
import 'package:b2s/controllers/drawer_controller.dart';
import 'package:b2s/utils/color/colors.dart';
import 'package:b2s/utils/routes/routes_name.dart';
import 'package:b2s/widgets/custom_appbar.dart';
import 'package:b2s/widgets/custom_bottomnavbar.dart';
import 'package:b2s/widgets/drawer.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FavouriteListingScreen extends StatelessWidget {
  final MyDrawerController drawerCtrl = Get.put(MyDrawerController());
  final ListingDetailController listingDetailCtrl = Get.put(ListingDetailController());
  
  final FavouriteListingModel favouriteListingModel = Get.arguments;
  FavouriteListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    int page = 2;
    return Scaffold(
      key: drawerCtrl.scaffoldKey3,
      drawer: MyDrawer(),
      appBar: customAppBar(context, 'Favourites Listings', page),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Center(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundColor: MyColors.btnColor,
                child: Icon(
                  Icons.favorite_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'View Saved Businesses',
                style: TextStyle(
                    color: MyColors.txtColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Buyers are able to view all the properties they\nhave short listed.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              Expanded(
                child: favouriteListingModel.listings!.isEmpty
                    ? const NoFavouriteListingsFound()
                    : GridView.builder(
                        padding:
                            const EdgeInsets.only(left: 12, top: 15, right: 12),
                        scrollDirection: Axis.vertical,
                        itemCount: favouriteListingModel.listings!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.8,
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                        ),
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Image.network(
                                    // 'assets/images/dark.jpg',
                                    '${favouriteListingModel.listings![index].imageUrl}',
                                    height: MediaQuery.of(context).size.height,
                                    // height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              /// add shadow over image
                              GestureDetector(
                                onTap: () {
                                  print('Hello shadow');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(200, 10, 10, 10),
                                        Color.fromARGB(0, 0, 0, 0),
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      stops: [0.03, 1],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 50,
                                left: 8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      constraints: const BoxConstraints(
                                        maxWidth: 180,
                                      ),
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          maxWidth: 160,
                                        ),
                                        child: Text(
                                          // 'The Best Seaside Cafe On...',
                                          '${favouriteListingModel.listings![index].shortHeading}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on_outlined,
                                          size: 13,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Container(
                                          constraints: const BoxConstraints(
                                              maxWidth: 140,
                                          ),
                                          child: Text(
                                            // 'Queensland',
                                            '${favouriteListingModel.listings![index].location}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Boxicons.bx_purchase_tag_alt,
                                          size: 13,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Container(
                                          constraints: const BoxConstraints(
                                              maxWidth: 153,
                                          ),
                                          child: Text(
                                            // '\$595,000 WIWO',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            '${favouriteListingModel.listings![index].price}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 20, bottom: 8,
                                    ),
                                    height: height * 0.04,
                                    width: width * 0.36,
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ChoiceButtons(
                                          height: height * 0.04,
                                          width: width * 0.085,
                                          color: Colors.transparent,
                                          borderRadius: 50,
                                          borderWidth: 1,
                                          borderColor: MyColors.btnColor,
                                          onTap: () {
                                            print('refresh');
                                          },
                                          child: Transform.scale(
                                            scale: 0.4,
                                            child: SvgPicture.asset(
                                              'assets/icons/refresh-line.svg',
                                            ),
                                          ),
                                        ),
                                        ChoiceButtons(
                                          height: height * 0.04,
                                          width: width * 0.085,
                                          color: Colors.transparent,
                                          borderRadius: 50,
                                          borderWidth: 1,
                                          borderColor: Colors.red,
                                          onTap: () {
                                            print('close');
                                          },
                                          child: Transform.scale(
                                            scale: 0.3,
                                            child: SvgPicture.asset(
                                              'assets/icons/close.svg',
                                            ),
                                          ),
                                        ),
                                        ChoiceButtons(
                                          height: height * 0.04,
                                          width: width * 0.085,
                                          color: Colors.transparent,
                                          borderRadius: 50,
                                          borderWidth: 1,
                                          borderColor: MyColors.greenColor,
                                          onTap: () {
                                            print('fav');
                                          },
                                          child: Transform.scale(
                                            scale: .4,
                                            child: SvgPicture.asset(
                                              'assets/icons/heart.svg',
                                            ),
                                          ),
                                        ),
                                        ChoiceButtons(
                                          height: height * 0.04,
                                          width: width * 0.085,
                                          color: Colors.transparent,
                                          borderRadius: 50,
                                          borderWidth: 1,
                                          borderColor: Colors.white,
                                          onTap: () async {
                                            // var listingDetail = await listingDetailCtrl.getListingDetail(1, 1, '/businesses-details/established-fully-promoted-franchise-for-sale-customised-marketin-340697.php');
                                            // print('listingDetail');
                                            // print(listingDetail);

                                            Get.toNamed(
                                                RoutesName.detailScreen);
                                          },
                                          child: Transform.scale(
                                            scale: .5,
                                            child: SvgPicture.asset(
                                              'assets/icons/info-lg.svg',
                                            ),
                                          ),
                                        ),
                                        // ChoiceButtons(
                                        //   height: height * 0.048,
                                        //   width: width*0.1+1,
                                        //   color: Colors.transparent,
                                        //   borderRadius: 50,
                                        //   borderWidth: 1,
                                        //   borderColor: MyColors.magentaColor,
                                        //   onTap: (){},
                                        //   child: Transform.scale(
                                        //     scale: .5,
                                        //     child: SvgPicture.asset(
                                        //       'assets/icons/Group 79.svg',
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
