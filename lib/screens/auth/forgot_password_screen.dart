import 'package:b2s/controllers/auth_controllers/forgot_password_controller.dart';
import 'package:b2s/utils/color/colors.dart';
import 'package:b2s/utils/routes/routes_name.dart';
import 'package:b2s/widgets/build_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final ForgotPasswordController forgotPasswordCtrl =
      Get.put(ForgotPasswordController());
  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: Wrap(
        children: [
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
                        'Forgot Password',
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
                child: Column(
                  children: [
                    Image.asset('assets/images/lock.png'),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    const Text(
                      'Forgot Your Password',
                      style: TextStyle(color: MyColors.txtColor, fontSize: 22),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    const Text(
                      'Enter The Registered Email and We Will\nSend You a Confirmation code To Reset\nYour Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    BuildTextFormField(
                      height: height * 0.065,
                      hintText: 'Your Email',
                      controller: forgotPasswordCtrl.emailCtrl.value,
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
                      height: height * 0.025,
                    ),
                    GestureDetector(
                      onTap: () async {
                        // String email = '';
                        // int countryId = 1;
                        // var forgotUserPassword = await forgotPasswordCtrl.forgotPassword(email, countryId);
                        Get.toNamed(RoutesName.verifyEmailScreen);
                      },
                      child: Container(
                        height: height * 0.065,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: MyColors.btnColor,
                        ),
                        child: const Center(
                          child: Text(
                            'Submit Now',
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
        ],
      ),
    );
  }
}
