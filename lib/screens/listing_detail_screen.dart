import 'package:b2s/controllers/detail_slider_controller.dart';
import 'package:b2s/controllers/listing_detail_controller.dart';
import 'package:b2s/models/listing_detail_model.dart';
import 'package:b2s/utils/color/colors.dart';
import 'package:b2s/widgets/custom_appbar.dart';
import 'package:b2s/widgets/custom_bottomnavbar.dart';
import 'package:b2s/widgets/enquiry_bottom_sheet.dart';
import 'package:b2s/widgets/call_bottom_sheet.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  final DetailSliderController detailSliderCtrl = Get.put(DetailSliderController());
  final ListingDetailController listingDetailCtrl = Get.put(ListingDetailController());
  DetailScreen({Key? key}) : super(key: key);

  final ListingDetailModel listingDetailModel = Get.arguments;
  /*final List imageList = [
    {"id": 1, "image_path": 'assets/images/dog.jpg'},
    {"id": 2, "image_path": 'assets/images/food.webp'},
    {"id": 3, "image_path": 'assets/images/mountain.jpg'},
    {"id": 4, "image_path": 'assets/images/random.jpg'},
    {"id": 5, "image_path": 'assets/images/random.jpg'},
    {"id": 6, "image_path": 'assets/images/random.jpg'},
    {"id": 7, "image_path": 'assets/images/random.jpg'},
    {"id": 8, "image_path": 'assets/images/random.jpg'},
    {"id": 9, "image_path": 'assets/images/random.jpg'},
    {"id": 10, "image_path": 'assets/images/random.jpg'},
  ];*/


  @override
  Widget build(BuildContext context) {
  String description = "${listingDetailModel.listingDetails!.businessDescription}";
  String text = listingDetailCtrl.removeHtmlTags(description);
    int page = 4;
    return Scaffold(
      appBar: customAppBar(context, 'Back', page),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {},
                    child: CarouselSlider(
                      items:
                      // imageList
                      //     .map((item) => Image.asset(
                      //           item['image_path'],
                      //           fit: BoxFit.cover,
                      //           width: double.infinity,
                      //         ))
                      //     .toList(),
                      listingDetailModel.businessImages
                          ?.map((image) => Image.network(
                                image.lrgImage.toString(),
                                fit: BoxFit.contain,
                                width: double.infinity,
                              ))
                          .toList(),
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: false,
                        aspectRatio: 1.2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          detailSliderCtrl.currentSlideIndex = index;
                        },
                      ),
                      carouselController: detailSliderCtrl.carouselController,
                    ),
                  ),
                  Positioned(
                    right: 15,
                    bottom: 285,
                    child: Row(children: [
                      Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade900,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Obx(
                            () => Text(
                              '${detailSliderCtrl.currentSlideIndex + 1} of ${listingDetailModel.businessImages!.length}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ]
                        /*imageList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => carouselController.animateToPage(entry.key),
                            child: Container(
                              width: 10.0,
                              height: 10.0,
                              // width: currentIndex == entry.key ? 17 : 7,
                              // height: 7.0,

                              margin: const EdgeInsets.symmetric(horizontal: 3.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // borderRadius: BorderRadius.circular(10),
                                color: currentIndex == entry.key ? Colors.red : Colors.black,
                              ),
                              child: Center(
                              child: Text(
                          "${entry.key + 1}",
                          style: TextStyle(
                          color: currentIndex == entry.key ? Colors.white : Colors.black,
                          fontSize: 5,
                          fontWeight: FontWeight.bold,
                          ),
                            ),
                          ),
                            ),
                          );
                          }).toList(),*/

                        ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.035,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Transform.scale(
                scale: 0.7,
                child: Image.network(
                  listingDetailModel.listingDetails!.advertiserLogo.toString(),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 10, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 'Successful Cafe South East Brisbane - Any Reasonable\nOffer & Must Be Sold!',
                    '${listingDetailModel.listingDetails!.businessHeading}',
                    style: const TextStyle(
                      color: MyColors.txtColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    // 'Advert Id: 335497, Sellers Ref: (bonza_63_1488)',
                    'Advert Id: ${listingDetailModel.listingDetails!.businessID}',
                    style: const TextStyle(
                      color: MyColors.btnColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Location: ',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        // 'Brisbane, Queensland',
                        '${listingDetailModel.listingDetails!.businessLocation}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      const Text(
                        'Category: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        // 'Takeaway Food, Restaurant, Cafe and Coffee Shop',
                        '${listingDetailModel.listingDetails!.businessCategory}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Asking Price: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        // '\$120,000 + Stock At Value',
                        '${listingDetailModel.listingDetails!.businessPrice}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 20,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Sales revenue: ',
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        '${listingDetailModel.listingDetails!.salesRevenue}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Net profit: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '${listingDetailModel.listingDetails!.netProfit}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Furniture/Fixtures value: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '${listingDetailModel.listingDetails!.furnitureValue}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text('Business description',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyColors.txtColor,
                    fontSize: 18,
                  ),),
                  Text(text, style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black
                  ),),
                  /*Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.bottomSheet(EnquiryBottomSheet());
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8)),
                                color: MyColors.btnColor),
                            child: const Center(
                              child: Text(
                                'Enquiry Now',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              const CallBottomSheet(),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                                color: MyColors.btnColor),
                            child: const Center(
                              child: Text(
                                'Call',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),*/
                ],
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  // Get.bottomSheet(EnquiryBottomSheet());
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
                        height: MediaQuery.of(context).size.height *
                            0.7, // Set the desired height
                        child: EnquiryBottomSheet(),
                      );
                    },
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                      ),
                      color: MyColors.btnColor),
                  child: const Center(
                    child: Text(
                      'Enquiry Now',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 1,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      const CallBottomSheet(),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        color: MyColors.btnColor),
                    child: const Center(
                      child: Text(
                        'Call',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
