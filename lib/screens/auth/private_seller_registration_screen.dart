import 'package:b2s/utils/color/colors.dart';
import 'package:b2s/widgets/broker_registration_form.dart';
import 'package:b2s/widgets/custom_bottomnavbar.dart';
import 'package:b2s/widgets/franchise_registration_form.dart';
import 'package:b2s/widgets/seller_registration_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controllers/private_seller_registration_controller.dart';

class PrivateSellerRegistrationScreen extends StatelessWidget {
  final PrivateSellerRegistrationController privateSellerRegistrationCtrl =
  Get.put(PrivateSellerRegistrationController());
  PrivateSellerRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      height: 35,
                      width: 35,
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
                      'Private Seller Registration',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Please Fill the from below\nto Register life easier.',
              textAlign: TextAlign.center,
              style: TextStyle(color: MyColors.txtColor, fontSize: 18),
            ),
            const Text(
              "Selling a business shouldn't be stressful.\nOur step-by-step process gets your business in front\nof a large, engaged audience - quickly.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                      () => Radio(
                    value: 1,
                    groupValue:
                    privateSellerRegistrationCtrl.selectedValue.value,
                    onChanged: (val) {
                      privateSellerRegistrationCtrl.selectedValue.value = val!;
                    },
                    activeColor: MyColors.txtColor,
                  ),
                ),
                const Text(
                  'Seller Registration',
                  style: TextStyle(fontSize: 13, color: MyColors.txtColor),
                ),
                Obx(
                      () => Radio(
                    value: 2,
                    groupValue:
                    privateSellerRegistrationCtrl.selectedValue.value,
                    onChanged: (val) {
                      privateSellerRegistrationCtrl.selectedValue.value = val!;
                    },
                    activeColor: MyColors.txtColor,
                  ),
                ),
                const Text(
                  'Broker Registration',
                  style: TextStyle(fontSize: 13, color: MyColors.txtColor),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                      () => Radio(
                    value: 3,
                    groupValue:
                    privateSellerRegistrationCtrl.selectedValue.value,
                    onChanged: (val) {
                      privateSellerRegistrationCtrl.selectedValue.value = val!;
                    },
                    activeColor: MyColors.txtColor,
                  ),
                ),
                const Text(
                  'Franchise Registration',
                  style: TextStyle(fontSize: 13, color: MyColors.txtColor),
                ),
              ],
            ),
            Obx(() {
              // if (privateSellerRegistrationCtrl.selectedValue == 1) {
              //   return const SellerRagistrationForm();
              // } else if (privateSellerRegistrationCtrl.selectedValue == 2) {
              //   return const BrokerRegistrationForm();
              // } else {
              //   return const FranchiseRegistrationForm();
              // }

              switch (privateSellerRegistrationCtrl.selectedValue.value) {
                case 1:
                  return const SellerRagistrationForm();
                case 2:
                  return const BrokerRegistrationForm();
                case 3:
                  return const FranchiseRegistrationForm();
                default:
                  return const SellerRagistrationForm();
              }
            }),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
