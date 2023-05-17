import 'package:b2s/controllers/drawer_controller.dart';
import 'package:b2s/utils/color/colors.dart';
import 'package:b2s/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';

/*class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool showBackButton;
  final bool showLogo;
  final String strTitle;
  final String showBackButtonName;
  final int page;
  final MyDrawerController drawerCtrl = Get.put(MyDrawerController());

  CustomAppBar({
    super.key,
    this.showBackButton = false,
    this.showLogo = true,
    this.strTitle = '',
    this.showBackButtonName = '',
    this.page = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: AppBar(
        leading: showBackButton
            ? GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: MyColors.txtColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(
                    Boxicons.bxs_left_arrow_alt,
                    color: Colors.white,
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {
                  drawerCtrl.openDrawer();
                },
                child: Container(
                  margin: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: MyColors.txtColor,
                      width: 1,
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/menu.png',
                    scale: 2,
                  ),
                ),
              ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: showBackButton
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            showBackButton
                ? const SizedBox()
                : const SizedBox(
                    width: 25,
                  ),
            showLogo
                ? Image.asset(
                    'assets/images/b2s_logo.png',
                    width: MediaQuery.of(context).size.width / 2.3,
                  )
                : const Text(
                    'Back',
                    style: TextStyle(
                        color: MyColors.txtColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                  ),
            showBackButton
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                  )
                : const SizedBox(
                    width: 24,
                  ),
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: MyColors.txtColor,
                  width: 1,
                ),
              ),
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  'assets/images/translate.png',
                  scale: 1.7,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: MyColors.txtColor,
                  width: 1,
                ),
              ),
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  'assets/images/login.png',
                  scale: 1.7,
                ),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}*/

AppBar customAppBar(context, String strTitle, int pageNo,
    {bool fromAuth = false}) {
  final MyDrawerController drawerCtrl = Get.put(MyDrawerController());
  final height = MediaQuery.of(context).size.height * 1;
  final width = MediaQuery.of(context).size.width * 1;
  return AppBar(
    // leadingWidth: 56,
    leading: Builder(builder: (BuildContext context) {
      if (pageNo == 7 || pageNo == 4) {
        return GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: MyColors.txtColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Boxicons.bxs_left_arrow_alt,
              color: Colors.white,
            ),
          ),
        );
      } else {
        return GestureDetector(
          onTap: () {
            drawerCtrl.openDrawer();
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: MyColors.txtColor,
                width: 1,
              ),
            ),
            child: Image.asset(
              'assets/images/menu.png',
              scale: 2.1,
            ),
          ),
        );
      }
    }),
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: pageNo == 5
        ? Center(
            child: Image.asset(
              'assets/images/b2s_logo.png',
              width: MediaQuery.of(context).size.width / 2.3,
            ),
          )
        : pageNo == 4
            ? Text(
                strTitle,
                style: const TextStyle(
                  color: MyColors.txtColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              )
            : Center(
                child: Text(
                  strTitle,
                  style: const TextStyle(
                    color: MyColors.txtColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Row(
          children: [
            Container(
              // height: 38,
              height: height * 0.045,
              // width: 38,
              width: width * 0.095,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: MyColors.txtColor,
                  width: 1,
                ),
              ),
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  'assets/images/translate.png',
                  scale: 1.7,
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Obx(
              ()=> drawerCtrl.isLoggedIn.value
                  ? Container(
                      // height: 38,
                      height: height * 0.045,
                      // width: 38,
                      width: width * 0.095,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: MyColors.txtColor,
                          width: 1,
                        ),
                      ),
                      child: InkWell(
                          onTap: () async {
                            await drawerCtrl.logout();
                          },
                          child: const Icon(
                            Icons.logout_outlined,
                            color: MyColors.txtColor,
                          )),
                    )
                  : Container(
                      // height: 38,
                      height: height * 0.045,
                      // width: 38,
                      width: width * 0.095,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: MyColors.txtColor,
                          width: 1,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(RoutesName.loginProgressScreen);
                        },
                        child: Image.asset(
                          'assets/images/login.png',
                          scale: 1.7,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      )
    ],

    /*Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
                width: 25,
              ),
         Image.asset(
                'assets/images/b2s_logo.png',
                width: MediaQuery.of(context).size.width / 2.3,
              ),
           const Text(
                'Back',
                style: TextStyle(
                    color: MyColors.txtColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 17),
              ),
        SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
              ),
        const SizedBox(
                width: 24,
              ),
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: MyColors.txtColor,
              width: 1,
            ),
          ),
          child: InkWell(
            onTap: () {},
            child: Image.asset(
              'assets/images/translate.png',
              scale: 1.7,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: MyColors.txtColor,
              width: 1,
            ),
          ),
          child: InkWell(
            onTap: () {},
            child: Image.asset(
              'assets/images/login.png',
              scale: 1.7,
            ),
          ),
        ),
      ],
    ),*/
    automaticallyImplyLeading: false,
  );
}
