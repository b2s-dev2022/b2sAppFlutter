import 'package:b2s/controllers/auth_controllers/reset_password_controller.dart';
import 'package:b2s/utils/color/colors.dart';
import 'package:b2s/widgets/build_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  final ResetPasswordController resetPasswordCtrl =
  Get.put(ResetPasswordController());
  ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: Wrap(children: [
        Column(
          children: [
            SafeArea(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: height * 0.04,
                      width: width * 0.088,
                      margin: const EdgeInsets.only(top: 10, left: 20),
                      decoration: BoxDecoration(
                        color: MyColors.txtColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Boxicons.bxs_left_arrow_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Reset Your Password',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
              child: Column(
                children: [
                  Image.asset('assets/images/Image 10.png'),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  const Text(
                    'Reset Your Password',
                    style: TextStyle(color: MyColors.txtColor, fontSize: 22),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Text(
                    'A Confirmation Code Has Been Sent to you,\nPlease Check Your Incoming Mail And\nRetype The Code',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  BuildTextFormField(
                    height: height * 0.065,
                    hintText: 'New Password',
                    controller: resetPasswordCtrl.newPasswordCtrl.value,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                    onSaved: (name) {},
                    validator: (name) {
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
                        'assets/icons/Group 87.svg',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  BuildTextFormField(
                    height: height * 0.065,
                    hintText: 'Confirm New Password',
                    controller: resetPasswordCtrl.newPasswordCtrl.value,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                    onSaved: (name) {},
                    validator: (name) {
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
                        'assets/icons/Group 87.svg',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  GestureDetector(
                    onTap: () async {},
                    child: Container(
                      height: height * 0.065,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: MyColors.btnColor,
                      ),
                      child: const Center(
                        child: Text(
                          'Reset Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
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
      ]),
    );
  }
}
