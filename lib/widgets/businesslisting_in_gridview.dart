import 'package:b2s/controllers/favourite_controller.dart';
import 'package:b2s/models/business_listing_model.dart';
import 'package:b2s/utils/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusinessListingInGridview extends StatelessWidget {
  final FavouriteListingController favouriteListingCtrl = Get.put(FavouriteListingController());
  final BusinessListingModel businessListingModel = Get.arguments;
  BusinessListingInGridview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.62,
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: businessListingModel.listings!.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade500,
                width: 0.7,
              ),
              // boxShadow: const [
              //   BoxShadow(
              //     color: Colors.grey,
              //     offset: Offset(5,5)
              //   ),
              // ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          // height: MediaQuery.of(context).size.height * 0.136,
                          // width: MediaQuery.of(context).size.width * 0.5,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Image.network(
                            // 'assets/images/dark.jpg',
                            '${businessListingModel.listings![index].imageUrl}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: width * 0.32,
                      top: height * 0.02,
                      child: GestureDetector(
                        onTap: () async {
                          SharedPreferences localStorage = await SharedPreferences.getInstance();
                          String listingId = businessListingModel.listings![index].id.toString();
                          // savedListingIds.add(listingId);
                          if(favouriteListingCtrl.savedListingIds.contains(listingId)){
                            favouriteListingCtrl.removeFromFavourite(listingId);
                          } else{
                            favouriteListingCtrl.addToFavourite(listingId);
                          }

                          var savedKey = localStorage.setString('savedKey', favouriteListingCtrl.savedListingIds.toString());
                          print('set savedKey');
                          print(savedKey);
                          print(favouriteListingCtrl.savedListingIds);
                        },
                        child: CircleAvatar(
                          radius: 12.0,
                          backgroundColor: Colors.white,
                          child: Obx(
                                ()=> Icon(
                              Boxicons.bxs_heart,
                              color: favouriteListingCtrl.savedListingIds.contains(businessListingModel.listings![index].id.toString()) ? Colors.red : Colors.blue,
                              size: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // 'Boutique Yarra Vall...',
                        '${businessListingModel.listings![index].heading1}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        // 'Cottles Bridge, Melbourne,',
                        '${businessListingModel.listings![index].location}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Price: ',
                            style: TextStyle(
                              color: MyColors.btnColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 135),
                            child: Text(
                              // '\$2,750,000',
                              '${businessListingModel.listings![index].price}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: MyColors.btnColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        // 'Food  >  Manufacturing a...',
                        '${businessListingModel.listings![index].catename}'
                            ' > '
                            '${businessListingModel.listings![index].multicate}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
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
                            color: Colors.grey.shade500,
                            width: 0,
                          ),
                          borderRadius: BorderRadius.circular(3),
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
          );
        },
      ),
    );
  }
}
