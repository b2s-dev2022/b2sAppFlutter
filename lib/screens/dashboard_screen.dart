import 'package:b2s/controllers/business_listing_controller.dart';
import 'package:b2s/utils/color/colors.dart';
import 'package:b2s/utils/routes/routes_name.dart';
import 'package:b2s/widgets/custom_appbar.dart';
import 'package:b2s/widgets/custom_bottomnavbar.dart';
import 'package:b2s/widgets/drawer.dart';
import 'package:b2s/widgets/swiper_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/drawer_controller.dart';

class DashboardScreen extends StatelessWidget {
  final MyDrawerController drawerCtrl = Get.put(MyDrawerController());
  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int page = 5;
    return Scaffold(
      key: drawerCtrl.scaffoldKey1,
      drawer: MyDrawer(),
      appBar: customAppBar(context, '', page),
      body: Column(
        children: [
          Listener(
            onPointerMove: (pointerEvent) {},
            onPointerCancel: (_) {},
            onPointerUp: (_) {},
            child: Draggable(
              feedback: Material(
                type: MaterialType.transparency,
                child: SwiperCard(),
              ),
              // childWhenDragging: Container(),
              onDragEnd: (details) {
                const minimumDrag = 100;
                if (details.offset.dx > minimumDrag) {
                  print('right');
                } else if (details.offset.dx < -minimumDrag) {
                  print('left');
                }
              },
              child: SwiperCard(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
