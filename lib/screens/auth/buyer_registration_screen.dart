import 'package:b2s/controllers/auth_controllers/registration_controller.dart';
import 'package:b2s/utils/color/colors.dart';
import 'package:b2s/utils/routes/routes_name.dart';
import 'package:b2s/widgets/build_textform_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuyerRegistrationScreen extends StatelessWidget {
  final BuyerRegistrationController buyerRegistrationCtrl =
      Get.put(BuyerRegistrationController());
  BuyerRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: buyerRegistrationCtrl.formKey,
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
                        'Buyer Register',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.04,
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
              const Text(
                'Hello',
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Create an account to continue',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    BuildTextFormField(
                      buyerRegister: true,
                      height: height * 0.065,
                      hintText: 'Your Name',
                      controller: buyerRegistrationCtrl.nameCtrl.value,
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
                      buyerRegister: true,
                      height: height * 0.065,
                      hintText: 'Your Email',
                      controller: buyerRegistrationCtrl.emailCtrl.value,
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
                      buyerRegister: true,
                      height: height * 0.065,
                      hintText: 'Phone No',
                      controller: buyerRegistrationCtrl.phoneCtrl.value,
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
                      buyerRegister: true,
                      height: height * 0.065,
                      hintText: 'Your Password',
                      controller: buyerRegistrationCtrl.passwordCtrl.value,
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
                      suffixIcon: Obx(
                        () => IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          icon: buyerRegistrationCtrl.isPasswordHidden.value
                              ? Icon(
                                  Icons.visibility_off_outlined,
                                  size: 20,
                                  color: Colors.blue.shade200,
                                )
                              : Icon(
                                  Icons.visibility_outlined,
                                  size: 20,
                                  color: Colors.blue.shade200,
                                ),
                          onPressed: () {
                            buyerRegistrationCtrl.isPasswordHidden.toggle();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    BuildTextFormField(
                      buyerRegister: true,
                      height: height * 0.065,
                      hintText: 'Retype Password',
                      controller:
                          buyerRegistrationCtrl.confirmPasswordCtrl.value,
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) {},
                      onSaved: (String? name) {},
                      validator: (String? name) {
                        // if (name!.isEmpty) {
                        //   return 'Please re-type your password';
                        // }
                        return null;
                      },
                      prefixIcon: Transform.scale(
                        scale: 1,
                        child: SvgPicture.asset(
                          'assets/icons/Group 87.svg',
                        ),
                      ),
                      suffixIcon: Obx(
                        () => IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          icon: buyerRegistrationCtrl
                                  .isConfirmPasswordHidden.value
                              ? Icon(
                                  Icons.visibility_off_outlined,
                                  size: 20,
                                  color: Colors.blue.shade200,
                                )
                              : Icon(
                                  Icons.visibility_outlined,
                                  size: 20,
                                  color: Colors.blue.shade200,
                                ),
                          onPressed: () {
                            buyerRegistrationCtrl.isConfirmPasswordHidden
                                .toggle();
                          },
                        ),
                      ),
                    ),
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
                        value: buyerRegistrationCtrl.isChecked.value,
                        onChanged: (value) {
                          buyerRegistrationCtrl.isChecked.value = value!;
                        },
                      ),
                    ),
                    const Text(
                      'Remember me',
                      style: TextStyle(color: Colors.black),
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
                    if (buyerRegistrationCtrl.formKey.currentState!
                        .validate()) {
                      String email = buyerRegistrationCtrl.emailCtrl.value.text;
                      String name = buyerRegistrationCtrl.nameCtrl.value.text;
                      String phone = buyerRegistrationCtrl.phoneCtrl.value.text;
                      String password =
                          buyerRegistrationCtrl.passwordCtrl.value.text;
                      String confirmPassword =
                          buyerRegistrationCtrl.confirmPasswordCtrl.value.text;

                      var registerUser =
                          await buyerRegistrationCtrl.buyerRegistration(
                              email, name, phone, password, confirmPassword);

                      if (registerUser.toString().contains("all_errors")) {
                        Get.snackbar('Buyer Register',
                            registerUser['all_errors'][0].toString());
                      } else {
                        Get.toNamed(RoutesName.homeScreen);
                      }
                    } else {
                      print('Unsuccessful');
                    }
                  },
                  child: Container(
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: MyColors.btnColor),
                    child: const Center(
                      child: Text(
                        'Register Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Text.rich(
                TextSpan(
                  text: 'Already have an Account? ',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                        text: 'Sign in',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 15, color: MyColors.txtColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(RoutesName.loginProgressScreen);
                          },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
