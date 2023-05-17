import 'package:b2s/utils/color/colors.dart';
import 'package:b2s/utils/routes/routes_name.dart';
import 'package:b2s/widgets/custom_appbar.dart';
import 'package:b2s/widgets/search_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BusinessBrokerScreen extends StatelessWidget {
  const BusinessBrokerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, '', 5),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/dark.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  top: 40,
                  left: 125,
                  child: Text(
                    'Business Brokers',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 35,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Center(
                          child: Text(
                            'Search By category',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: MyColors.txtColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Center(
                          child: Text(
                            'Search By Alphabet',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: MyColors.txtColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 142),
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.93,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(1),
                      borderRadius: BorderRadius.circular(8),
                      // boxShadow: const [
                      //   BoxShadow(
                      //     color: Color(0xFFe8e8e8),
                      //     blurRadius: 5.0,
                      //     offset: Offset(0,2),
                      //   ),
                      //   BoxShadow(
                      //     color: Colors.white,
                      //     offset: Offset(-2,0),
                      //   ),
                      //   BoxShadow(
                      //     color: Colors.white,
                      //     offset: Offset(2,0),
                      //   ),
                      // ]
                    ),
                    child: TextFormField(
                      // controller: searchBarUiCtrl.txtEditingCtrl.value,
                      onChanged: (value) {
                        // searchBarUiCtrl.setTxt(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Search Keyword...',
                        hintStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue.shade200,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.blue.shade200,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 24,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFe8e8e8),
                            blurRadius: 5.0,
                            offset: Offset(0, 2),
                          ),
                        ]),
                    child: const Center(
                      child: Text(
                        'ACT',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    height: 24,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFe8e8e8),
                            blurRadius: 5.0,
                            offset: Offset(0, 2),
                          ),
                        ]),
                    child: const Center(
                      child: Text(
                        'New South Wales',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    height: 24,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFe8e8e8),
                            blurRadius: 5.0,
                            offset: Offset(0, 2),
                          ),
                        ]),
                    child: const Center(
                      child: Text(
                        'Northern Territory',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    height: 24,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFe8e8e8),
                            blurRadius: 5.0,
                            offset: Offset(0, 2),
                          ),
                        ]),
                    child: const Center(
                      child: Text(
                        'Queensland',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 24,
                  width: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 0),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0, 2),
                        ),
                      ]),
                  child: const Center(
                    child: Text(
                      'South Australia',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 11, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: 24,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 0),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0, 2),
                        ),
                      ]),
                  child: const Center(
                    child: Text(
                      'Tasmania',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 11, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: 24,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 0),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0, 2),
                        ),
                      ]),
                  child: const Center(
                    child: Text(
                      'Victoria',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 11, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: 24,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 0),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0, 2),
                        ),
                      ]),
                  child: const Center(
                    child: Text(
                      'Western Australia',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.19,
                  width: MediaQuery.of(context).size.width * 0.44,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      border: Border.all(color: Colors.indigo.shade100)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Column(
                      children: [
                        const Text(
                          'ABSBusinessSalesPty...',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: const [
                              Text(
                                'Brisbane,Queensland',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'ForSale:',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                              Text('0'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'UnderOffer:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              Text('0')
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Sold:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              Text('0'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 23, top: 30),
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.38,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.indigo.shade300,
                        width: 0,
                      )),
                  child: Image.asset(
                    'assets/images/logo2.jpeg',
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: (){
                    Get.toNamed(RoutesName.businessBrokerDetailScreen);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 190, right: 195),
                    height: MediaQuery.of(context).size.height * 0.047,
                    width: MediaQuery.of(context).size.width * 0.1,
                    decoration: BoxDecoration(
                      color: MyColors.btnColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Transform.scale(
                      scale: 0.7,
                      child: SvgPicture.asset(
                        'assets/icons/read-more.svg',
                      ),
                    ),
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
