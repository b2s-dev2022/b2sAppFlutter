import 'package:b2s/controllers/enq_bottomsheet_controller.dart';
import 'package:b2s/utils/color/colors.dart';
import 'package:b2s/widgets/build_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EnquiryBottomSheet extends StatelessWidget {
  final EnquiryBottomSheetController enquiryBottomSheetCtrl =
      Get.put(EnquiryBottomSheetController());
  EnquiryBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              title: const Text(
                'Make an Enquiry',
                style:
                    TextStyle(
                        color: MyColors.txtColor,
                        fontFamily: 'Jost',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                    ),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: const Icon(
                  Icons.close,
                  size: 20,
                  color: Colors.grey,
                ),
                onPressed: () => Get.back(),
              ),
            ),
            const Divider(
              thickness: 1,
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  BuildTextFormField(
                    buyerRegister: false,
                    height: height * 0.065,
                    hintText: 'Your Name',
                    controller: enquiryBottomSheetCtrl.nameCtrl.value,
                    keyboardType: TextInputType.name,
                    onChanged: (value) {},
                    onSaved: (String? name) {},
                    validator: (String? name) {
                      // if (name!.isEmpty) {
                      //   return 'Please enter name';
                      // }
                      return null;
                    },
                    prefixIcon: Transform.scale(
                      scale: 1,
                      child: SvgPicture.asset(
                        'assets/icons/Group 85.svg',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  BuildTextFormField(
                    buyerRegister: false,
                    height: height * 0.065,
                    hintText: 'Your Mail',
                    controller: enquiryBottomSheetCtrl.emailCtrl.value,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {},
                    onSaved: (String? name) {},
                    validator: (String? name) {
                      // if (name!.isEmpty) {
                      //   return 'Please enter Email';
                      // }
                      // if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      //     .hasMatch(value)) {
                      //   return "Please enter valid email";
                      // }
                      return null;
                    },
                    prefixIcon: Transform.scale(
                      scale: 1,
                      child: SvgPicture.asset(
                        'assets/icons/Group 84.svg',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  BuildTextFormField(
                    buyerRegister: false,
                    height: height * 0.065,
                    hintText: 'Your Phone Number',
                    controller: enquiryBottomSheetCtrl.phoneCtrl.value,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                    onSaved: (String? name) {},
                    validator: (String? name) {
                      // if (name!.isEmpty) {
                      //   return 'Please enter phone no';
                      // }
                      // if(value.length < 9){
                      //   return "Please enter valid phone";
                      // }
                      return null;
                    },
                    prefixIcon: Transform.scale(
                      scale: 1,
                      child: SvgPicture.asset(
                        'assets/icons/Group 86.svg',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  BuildTextFormField(
                    buyerRegister: false,
                    height: height * 0.065,
                    hintText: 'Best Time to Contact',
                    controller: enquiryBottomSheetCtrl.contactCtrl.value,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {},
                    onSaved: (String? name) {},
                    validator: (String? name) {
                      // if (name!.isEmpty) {
                      //   return 'Please enter password';
                      // }
                      return null;
                    },
                    prefixIcon: Transform.scale(
                      scale: 1,
                      child: SvgPicture.asset(
                        'assets/icons/Group 87.svg',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  BuildTextFormField(
                    prefixIconPosition: false,
                    buyerRegister: false,
                    height: height * 0.16,
                    hintText: 'Comments',
                    controller: enquiryBottomSheetCtrl.commentCtrl.value,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {},
                    onSaved: (String? name) {},
                    validator: (String? name) {
                      // if (name!.isEmpty) {
                      //   return 'Please enter password';
                      // }
                      return null;
                    },
                    prefixIcon: Transform.scale(
                      scale: 1,
                      child: SvgPicture.asset(
                        'assets/icons/Group 191.svg',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),

                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      // width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.065,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: MyColors.btnColor),
                      child: const Center(
                        child: Text(
                          'Send Enquiry',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}