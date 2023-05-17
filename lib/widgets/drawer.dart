import 'package:b2s/controllers/drawer_controller.dart';
import 'package:b2s/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatelessWidget {
  final MyDrawerController drawerCtrl = Get.put(MyDrawerController());
  MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: GetBuilder<MyDrawerController>(
        init: drawerCtrl,
        initState: (_) {
          drawerCtrl.checkBuyerLogin();
        },
        builder: (controller) {
          return ListView(
            children: [
              /* const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Home'),
              ),

              ListTile(
                leading: const Icon(
                  Icons.person_outline,
                  color: Colors.black,
                ),
                title: const Text('Register'),
                onTap: () {
                  Get.toNamed(RoutesName.privateSellerRegistrationScreen);
                },
              ),*/
              Obx(
                ()=> drawerCtrl.isLoggedIn.value
                    ? SizedBox()
                    : ListTile(
                        leading: const Icon(
                          Icons.person_outline,
                          color: Colors.black,
                        ),
                        title: const Text('Buyer Register'),
                        onTap: () {
                          Get.toNamed(RoutesName.buyerRegistrationScreen);
                        },
                      ),
              ),
              Obx(
                ()=> drawerCtrl.isLoggedIn.value
                    ? ListTile(
                        leading: const Icon(
                          Icons.logout_outlined,
                          color: Colors.black,
                        ),
                        title: const Text('Logout'),
                        onTap: () async {
                          await drawerCtrl.logout();
                        },
                      )
                    : ListTile(
                        leading: const Icon(
                          Icons.login_outlined,
                          color: Colors.black,
                        ),
                        title: const Text('Login'),
                        onTap: () {
                          Get.toNamed(RoutesName.loginProgressScreen);
                        },
                      ),
              ),

              /*ListTile(
                title: const Text('Businesses For Sale'),
                onTap: () {},
              ),

              ListTile(
                title: const Text('Selling Business'),
                onTap: () {
                  Get.toNamed(RoutesName.businessSellingScreen);
                },
              ),

              ListTile(
                title: const Text('Business Brokers'),
                onTap: () {
                  Get.toNamed(RoutesName.businessBrokerScreen);
                },
              ),

              ListTile(
                title: const Text('Franchise Opportunities'),
                onTap: () {},
              ),

              ListTile(
                title: const Text('Broker Products'),
                onTap: () {
                  Get.toNamed(RoutesName.brokerProductsScreen);
                },
              ),*/
            ],
          );
        },
      ),
    );
  }
}
