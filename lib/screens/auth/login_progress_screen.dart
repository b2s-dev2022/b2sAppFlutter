import 'package:b2s/controllers/auth_controllers/login_controller.dart';
import 'package:b2s/utils/color/colors.dart';
import 'package:b2s/utils/routes/routes_name.dart';
import 'package:b2s/widgets/build_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginProgressScreen extends StatelessWidget {
  final LoginController loginCtrl = Get.put(LoginController());
  LoginProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      'Sign in',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.15,
            ),
            Stack(
              children: [
                Container(
                  height: height * 0.1,
                  width: width * 0.21,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 230, 242, 255),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Image.asset(
                  'assets/images/b2s-icon-small.png',
                  height: height * 0.14,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.025,
            ),
            const Text(
              'Welcome back!',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Hello there, login to continue',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BuildTextFormField(
                    height: height * 0.065,
                    hintText: 'Email Id',
                    controller: loginCtrl.emailCtrl.value,
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
                        'assets/icons/Group 85.svg',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  BuildTextFormField(
                    height: height * 0.065,
                    hintText: 'Password',
                    controller: loginCtrl.passwordCtrl.value,
                    keyboardType: TextInputType.visiblePassword,
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

                  /*SizedBox(
                    height: height * 0.015,
                  ),
                  BuildTextFormField(
                    height: height * 0.065,
                    hintText: 'Verification Code',
                    controller: loginCtrl.verificationCodeCtrl.value,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {},
                    onSaved: (String? name) {},
                    validator: (String? name) {
                      // if (name!.isEmpty) {
                      //   return 'Please enter verification code';
                      // }
                      return null;
                    },
                    prefixIcon: Transform.scale(
                      scale: 1,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: MyColors.txtColor,
                        child: Transform.scale(
                          scale: 0.9,
                          child: const Icon(
                            Boxicons.bx_plus,
                            size: 22,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ),
                  ),*/
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Obx(
                        () => Checkbox(
                      side: BorderSide(
                        color: Colors.blue.shade200,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      value: loginCtrl.isChecked.value,
                      onChanged: (value) {
                        loginCtrl.isChecked.value = value!;
                      },
                    ),
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.22,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RoutesName.forgotPasswordScreen);
                    },
                    child: const Text(
                      'Forgot the Password?',
                      style: TextStyle(color: MyColors.txtColor),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GestureDetector(
                onTap: () async {
                  await loginCtrl.buyersLogin(
                      loginCtrl.emailCtrl.value.text,
                      loginCtrl.passwordCtrl.value.text
                  );
                  print('hlo');
                },
                child: Container(
                  // width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: MyColors.btnColor,
                  ),
                  child: const Center(
                    child: Text(
                      'Login Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
            ),
            Text.rich(
              TextSpan(
                  text: "Don't have an Account? ",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontSize: 15, color: MyColors.txtColor),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}