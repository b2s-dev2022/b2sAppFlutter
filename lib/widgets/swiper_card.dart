import 'package:b2s/controllers/listing_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:b2s/controllers/business_listing_controller.dart';
import 'package:b2s/models/business_listing_model.dart';
import 'package:b2s/utils/color/colors.dart';
import 'package:b2s/utils/routes/routes_name.dart';
import 'package:b2s/widgets/buttons_on_swiper_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SwiperCard extends StatefulWidget {

  const SwiperCard({super.key,});

  @override
  State<SwiperCard> createState() => _SwiperCardState();
}

class _SwiperCardState extends State<SwiperCard> {
  final BusinessListingController businessListingCtrl =
      Get.put(BusinessListingController());

  final ListingDetailController listingDetailCtrl =
      Get.put(ListingDetailController());

  final BusinessListingModel? businessListingModel = Get.arguments;

  @override
  void initState() {
    getFilterCategories();
    super.initState();
  }

  void getFilterCategories() async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  localStorage.setString('filterCat', businessListingModel!.filtercategories.toString());

  // print(businessListingModel!.filtercategories!.first.catName);
  // print(filterCategories);
  }


  /*final List imageList = [
    {"id": 1, "image_path": 'assets/images/dog.jpg'},
    {"id": 2, "image_path": 'assets/images/food.webp'},
    {"id": 3, "image_path": 'assets/images/mountain.jpg'},
    {"id": 4, "image_path": 'assets/images/random.jpg'},
    {"id": 5, "image_path": 'assets/images/random.jpg'},
    {"id": 6, "image_path": 'assets/images/random.jpg'},
  ];*/
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    final List<String> images = businessListingModel!
        .listings!.first.multiImages!
        .map((e) => e.lrgImage.toString())
        .toList();

    /*double indicatorWidth = 0.10; // Adjust the initial width of the indicators
    double indicatorHeight = 10.0; // Adjust the initial height of the indicators
    double indicatorSpacing = 8.0; // Adjust the initial spacing between the indicators
    final int imageCount = images.length;
    if (imageCount > 1) {
      // Calculate the width based on the image count
      indicatorWidth = width * 0.12 / imageCount.toDouble();
      // Adjust the height of the indicators
      indicatorHeight = height * 0.006;
      // Calculate the spacing based on the image count
      indicatorSpacing = 0.04 * width / imageCount.toDouble();
    }*/
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: SizedBox(
        height: height / 1.4,
        width: width,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                /* This onTop will not work because,
                 we have put a container on the top
                 of this SizedBox for shadow. */
                print('object');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  // height: height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        images.first,
                      ),
                      fit: BoxFit.fill
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: Offset(3,3),
                      )
                    ]
                  ),
                  // child:
                  // CarouselSlider(
                  //   items: images
                  //       .map(
                  //         (image) => Image.network(
                  //           image,
                  //           fit: BoxFit.fill,
                  //         ),
                  //       )
                  //       .toList(),
                  //
                  //   /*businessListingModel.listings
                  //           ?.map((e) => SingleChildScrollView(
                  //                 child: Column(
                  //                   children: e.multiImages!
                  //                       .map((image) => Image.network(
                  //                             image.lrgImage.toString(),
                  //                             fit: BoxFit.cover,
                  //                           ))
                  //                       .toList(),
                  //                 ),
                  //               ))
                  //           .toList(),*/
                  //
                  //   options: CarouselOptions(
                  //     height: height,
                  //     enableInfiniteScroll: false,
                  //     scrollPhysics: const BouncingScrollPhysics(),
                  //     autoPlay: false,
                  //     viewportFraction: 1,
                  //     onPageChanged: (index, reason) {
                  //       businessListingCtrl.currentIndex.value = index;
                  //     },
                  //   ),
                  //   carouselController: businessListingCtrl.carouselController,
                  // ),
                ),
              ),
            ),

            /// add shadow overlay
            GestureDetector(
              onTap: () {
                final length = images.length;

                // Swipe to the next image
                final currentIndex = businessListingCtrl.currentIndex.value;
                if (currentIndex < length - 1) {
                  businessListingCtrl.carouselController.nextPage();
                } else {
                  // You have reached the last image
                  // Perform any desired action or loop back to the first image
                  businessListingCtrl.carouselController.animateToPage(0);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(250, 10, 10, 10),
                      Color.fromARGB(15, 0, 0, 0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.03, 1],
                  ),
                ),
              ),
            ),

            /// indicator ui
            Positioned(
              top: height * 0.02,
              right: width * 0.05,
              child: Obx(
                () => Row(
                  children: List.generate(
                      businessListingModel!.listings!.first.multiImages!.length,
                      // imageCount,
                      (index) {
                    return InkWell(
                      onTap: () {
                        businessListingCtrl.carouselController
                            .animateToPage(index);
                      },
                      child: Container(
                        width: width * 0.1,
                        // width: indicatorWidth,
                        height: height * 0.006,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: businessListingCtrl.currentIndex.value == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              bottom: 90,
              left: 17,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 350
                    ),
                    child: Text(
                      // 'The Best Seaside Cafe On...',
                      // heading
                      '${businessListingModel!.listings!.first.heading1}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 22,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        // location
                        '${businessListingModel!.listings!.first.location}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Boxicons.bx_purchase_tag_alt,
                        size: 22,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        // price
                        '${businessListingModel!.listings!.first.price}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
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
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    // height: 50,
                    height: height * 0.06,
                    width: width * 0.62,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ChoiceButtons(
                          height: height * 0.055,
                          width: width * 0.12,
                          color: Colors.transparent,
                          borderRadius: 50,
                          borderWidth: 1,
                          borderColor: MyColors.btnColor,
                          onTap: () {},
                          child: Transform.scale(
                            scale: 0.4,
                            child: SvgPicture.asset(
                              'assets/icons/refresh-line.svg',
                            ),
                          ),
                        ),
                        ChoiceButtons(
                          height: height * 0.055,
                          width: width * 0.12,
                          color: Colors.transparent,
                          borderRadius: 50,
                          borderWidth: 1,
                          borderColor: Colors.red,
                          onTap: () {},
                          child: Transform.scale(
                            scale: 0.3,
                            child: SvgPicture.asset(
                              'assets/icons/close.svg',
                            ),
                          ),
                        ),
                        ChoiceButtons(
                          height: height * 0.055,
                          width: width * 0.12,
                          color: Colors.transparent,
                          borderRadius: 50,
                          borderWidth: 1,
                          borderColor: MyColors.greenColor,
                          onTap: () {},
                          child: Transform.scale(
                            scale: .4,
                            child: SvgPicture.asset(
                              'assets/icons/heart.svg',
                            ),
                          ),
                        ),
                        ChoiceButtons(
                          height: height * 0.055,
                          width: width * 0.12,
                          color: Colors.transparent,
                          borderRadius: 50,
                          borderWidth: 1,
                          borderColor: Colors.white,
                          onTap: () async {
                            int currentIndex = businessListingCtrl.currentIndex.value;

                            if (currentIndex >= 0 && currentIndex < businessListingModel!.listings!.length) {
                              int listingId = int.parse(businessListingModel!.listings![currentIndex].id.toString());
                              String pageUrl = businessListingModel!.listings![currentIndex].pageUrl.toString();
                              print(listingId);
                              print(pageUrl);
                              var listingDetail =  await listingDetailCtrl.getListingDetail(
                                  listingId, 1,
                                  pageUrl
                              );
                            Get.toNamed(RoutesName.detailScreen, arguments: listingDetail);
                            } else {
                              print('error');
                            }
                          },
                          child: Transform.scale(
                            scale: .5,
                            child: SvgPicture.asset(
                              'assets/icons/info-lg.svg',
                            ),
                          ),
                        ),
                        // ButtonsOnSwiperCard(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*Widget _buildActiveIndicator() {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2.0),
      child: Container(
        height: 3.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2.5),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x22000000),
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(0.0, 1.0))
            ]),
      ),
    ),
  );
}

Widget _buildInactiveIndicator() {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2.0),
      child: Container(
        height: 3.0,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(2.5)),
      ),
    ),
  );
}*/
