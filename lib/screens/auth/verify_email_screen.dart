import 'package:b2s/controllers/auth_controllers/email_verify_controller.dart';
import 'package:b2s/utils/color/colors.dart';
import 'package:b2s/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  final EmailVerifyController emailVerifyCtrl =
      Get.put(EmailVerifyController());
  VerifyEmailScreen({super.key});

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
                        'Verify Your Email',
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
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 75),
                child: Column(
                  children: [
                    Image.asset('assets/images/Image 9.png'),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    const Text(
                      'Verify Your Email',
                      style: TextStyle(color: MyColors.txtColor, fontSize: 20),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildCircularField(
                          context,
                          emailVerifyCtrl.otpController1.value,
                          emailVerifyCtrl.focusNode1.value,
                          emailVerifyCtrl.otpController1.value,
                          emailVerifyCtrl.focusNode1.value,
                        ),
                        _buildCircularField(
                          context,
                          emailVerifyCtrl.otpController2.value,
                          emailVerifyCtrl.focusNode2.value,
                          emailVerifyCtrl.otpController1.value,
                          emailVerifyCtrl.focusNode1.value,
                        ),
                        _buildCircularField(
                          context,
                          emailVerifyCtrl.otpController3.value,
                          emailVerifyCtrl.focusNode3.value,
                          emailVerifyCtrl.otpController2.value,
                          emailVerifyCtrl.focusNode2.value,
                        ),
                        _buildCircularField(
                          context,
                          emailVerifyCtrl.otpController4.value,
                          emailVerifyCtrl.focusNode4.value,
                          emailVerifyCtrl.otpController3.value,
                          emailVerifyCtrl.focusNode3.value,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    const Text(
                      'Did not Receive the code',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    InkWell(
                      onTap: () {
                        print('re-send code');
                      },
                      child: const Text(
                        'Re-Send Code',
                        style: TextStyle(
                          color: MyColors.txtColor,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Get.toNamed(RoutesName.resetPasswordScreen);
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

  Widget _buildCircularField(
      BuildContext context,
      TextEditingController controller,
      FocusNode focusNode,
      TextEditingController prevController,
      FocusNode prevFocusNode) {
    final EmailVerifyController emailVerifyCtrl =
        Get.put(EmailVerifyController());
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 0.8),
      ),
      child: TextFormField(
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.bottom,
        expands: true,
        maxLines: null,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: const InputDecoration(
          // hintText: '0',
          // counterText: '',
          border: InputBorder.none,
        ),
        onSaved: (pin) {},
        onChanged: (value) {
          if (value.length == 1) {
            if (focusNode == emailVerifyCtrl.focusNode1.value) {
              FocusScope.of(context)
                  .requestFocus(emailVerifyCtrl.focusNode2.value);
            } else if (focusNode == emailVerifyCtrl.focusNode2.value) {
              FocusScope.of(context)
                  .requestFocus(emailVerifyCtrl.focusNode3.value);
            } else if (focusNode == emailVerifyCtrl.focusNode3.value) {
              FocusScope.of(context)
                  .requestFocus(emailVerifyCtrl.focusNode4.value);
            } else {
              emailVerifyCtrl.focusNode1.value.unfocus();
            }
          } else if (value.isEmpty) {
            prevFocusNode.requestFocus();
          }
        },
      ),
    );
  }
}
