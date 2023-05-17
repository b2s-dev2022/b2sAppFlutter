import 'package:b2s/utils/color/colors.dart';
import 'package:b2s/widgets/custom_appbar.dart';
import 'package:b2s/widgets/custom_bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BusinessBrokerDetailScreen extends StatelessWidget {
  const BusinessBrokerDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int pageNo = 5;
    return Scaffold(
      appBar: customAppBar(context, '', pageNo),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SingleChildScrollView(
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
                    top: 10,
                    left: 95,
                    child: Text(
                      'AGORA Property Group',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.041,
                              // height: 35,
                              width: MediaQuery.of(context).size.width * 0.09,
                              // width: 35,
                              decoration: BoxDecoration(
                                // color: MyColors.btnColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Transform.scale(
                                scale: 1.01,
                                child: SvgPicture.asset(
                                  'assets/icons/Group 178.svg',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              'Profile',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.041,
                              // height: 35,
                              width: MediaQuery.of(context).size.width * 0.09,
                              // width: 35,
                              decoration: BoxDecoration(
                                // color: MyColors.btnColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Transform.scale(
                                scale: 1.01,
                                child: SvgPicture.asset(
                                  'assets/icons/Group 179.svg',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              'Agents',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.041,
                              // height: 35,
                              width: MediaQuery.of(context).size.width * 0.09,
                              // width: 35,
                              decoration: BoxDecoration(
                                // color: MyColors.btnColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Transform.scale(
                                scale: 1.01,
                                child: SvgPicture.asset(
                                  'assets/icons/Group 180.svg',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              'Businesses',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.041,
                              // height: 35,
                              width: MediaQuery.of(context).size.width * 0.09,
                              // width: 35,
                              decoration: BoxDecoration(
                                // color: MyColors.btnColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Transform.scale(
                                scale: 1.01,
                                child: SvgPicture.asset(
                                  'assets/icons/Group 181.svg',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              'Under Offer',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.041,
                              // height: 35,
                              width: MediaQuery.of(context).size.width * 0.09,
                              // width: 35,
                              decoration: BoxDecoration(
                                // color: MyColors.btnColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Transform.scale(
                                scale: 1.01,
                                child: SvgPicture.asset(
                                  'assets/icons/Group 182.svg',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              'Sold',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.only(top: 125),
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.92,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: MyColors.txtColor),
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
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/logo.webp',
                            fit: BoxFit.cover,
                            height: 50,
                          ),
                          const Divider(
                            color: MyColors.txtColor,
                            thickness: 0.5,
                          ),
                          const Text(
                            'AGORA Property Group',
                            style: TextStyle(fontSize: 22, color: Colors.black),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Business Broker Id : ',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.black),
                              ),
                              Text(
                                '6572',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.black),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Region : ',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.black),
                              ),
                              Text(
                                'Nedlands',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.black),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              const Text(
                                'Telephone : ',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.black),
                              ),
                              GestureDetector(
                                onTap: (){

                                },
                                child: const Text(
                                  '0417 9...',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: MyColors.txtColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: const [
                     Text(
                       'Welcome to AGORA Property Group.',
                       style: TextStyle(
                         fontSize: 16,
                         color: Colors.black,
                       ),
                     ),
                     SizedBox(
                       height: 25,
                     ),
                     Text(
                       'Prominently located at Level 1, 187 Stirling Highway,\nNedlands AGORA Property Group provides a\nprofessional, comprehensive and personal service\nfor ALL aspects of commercial property including:',
                       style: TextStyle(
                         fontSize: 16,
                         color: Colors.black,
                       ),
                     ),
                     SizedBox(
                       height: 15,
                     ),
                     Text(
                       '> Retail/bulky goods sales and leasing',
                       style: TextStyle(
                         fontSize: 14,
                         color: Colors.black,
                       ),
                     ),
                     SizedBox(
                       height: 5,
                     ),
                     Text(
                       '> Commercial sales and leasing',
                       style: TextStyle(
                         fontSize: 14,
                         color: Colors.black,
                       ),
                     ),
                     SizedBox(
                       height: 5,
                     ),
                     Text(
                       '> Industrial sales and leasing',
                       style: TextStyle(
                         fontSize: 14,
                         color: Colors.black,
                       ),
                     ),
                     SizedBox(
                       height: 5,
                     ),
                     Text(
                       '> Commercial/retail/industrial property management',
                       style: TextStyle(
                         fontSize: 14,
                         color: Colors.black,
                       ),
                     ),
                     SizedBox(
                       height: 5,
                     ),
                     Text(
                       '> Project consulting, co-ordination and marketing',
                       style: TextStyle(
                         fontSize: 14,
                         color: Colors.black,
                       ),
                     ),
                   ],
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
