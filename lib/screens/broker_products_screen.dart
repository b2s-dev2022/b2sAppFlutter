import 'package:b2s/utils/color/colors.dart';
import 'package:b2s/widgets/custom_appbar.dart';
import 'package:b2s/widgets/custom_bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrokerProductsScreen extends StatelessWidget {
  const BrokerProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int pageNo = 5;
    return Scaffold(
      appBar: customAppBar(context, '', pageNo),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
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
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.only(top: 125),
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.92,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(1),
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: MyColors.txtColor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'UNIQUE & BEST ONLINE EXPOSURE\nAT UNBEATABLE PRICE',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'You can contact us directly by phone during\nbusiness hours or by email anytime. Please use\nthe email section below and we will get back to\nyou as soon as we can. The easy maths question\nis to prove you are a real person and not a robot so we can eliminate unnecessary spam.',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 38,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      color: MyColors.txtColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        child: SvgPicture.asset(
                                          'assets/icons/Group 86.svg',
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      const Text(
                                        'Call Us Now',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 38,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: MyColors.txtColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Row(
                                    children: const [
                                      CircleAvatar(
                                          child: Icon(
                                        Boxicons.bxs_right_arrow_alt,
                                        size: 29,
                                      )),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        'Find Out More',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: MyColors.txtColor)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: MyColors.btnColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 17, horizontal: 20),
                            child: Text(
                              'ENQUIRE NOW',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                // width: MediaQuery.of(context).size.width - 0,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextFormField(
                                  // textAlign: TextAlign.center,
                                  // controller: bottomSheetCtrl.nameCtrl,
                                  onChanged: (value) {
                                    // searchBarUiCtrl.setTxt(value);
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(top: 0),
                                    hintText: 'Your Name',
                                    hintStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                    prefixIcon: Transform.scale(
                                      scale: 0.6,
                                      child: SvgPicture.asset(
                                        'assets/icons/Group 85.svg',
                                        alignment: Alignment.topLeft,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue.shade100),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Colors.blue.shade100),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                // width: MediaQuery.of(context).size.width - 0,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextFormField(
                                  // controller: bottomSheetCtrl.emailCtrl,
                                  onChanged: (value) {
                                    // searchBarUiCtrl.setTxt(value);
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(top: 0),
                                    hintText: 'Your Mail',
                                    hintStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                    prefixIcon: Transform.scale(
                                      scale: 0.6,
                                      child: SvgPicture.asset(
                                        'assets/icons/Group 84.svg',
                                        alignment: Alignment.topLeft,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue.shade100),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Colors.blue.shade100),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                // width: MediaQuery.of(context).size.width - 0,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextFormField(
                                  // controller: bottomSheetCtrl.phoneCtrl,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    // searchBarUiCtrl.setTxt(value);
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(top: 0),
                                    hintText: 'Phone No',
                                    hintStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                    prefixIcon: Transform.scale(
                                      scale: 0.6,
                                      child: SvgPicture.asset(
                                        'assets/icons/Group 86.svg',
                                        alignment: Alignment.bottomLeft,
                                        // fit: BoxFit.contain,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue.shade100),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Colors.blue.shade100),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                                // width: MediaQuery.of(context).size.width - 0,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextFormField(
                                  maxLines: 5,
                                  // controller: bottomSheetCtrl.commentCtrl,
                                  onChanged: (value) {
                                    // searchBarUiCtrl.setTxt(value);
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(top: 25),
                                    hintText: 'Phone No',
                                    isCollapsed: true,
                                    hintStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                    prefixIcon: Transform.scale(
                                      alignment: Alignment.topCenter,
                                      scale: 0.5,
                                      child: SvgPicture.asset(
                                        'assets/icons/Group 191.svg',
                                        alignment: Alignment.topLeft,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue.shade100),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Colors.blue.shade100),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
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
