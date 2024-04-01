import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:parkmanager/app/components/bottom_bar_item.dart';
import 'package:parkmanager/app/modules/addparkingplace/views/addparkingplace_view.dart';
import 'package:parkmanager/utils/constants/constant_colors.dart';

import '../controllers/home_admin_controller.dart';

class HomeAdminView extends GetView<HomeController> {
  const HomeAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
        body: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: controller.pages,
        ),
        bottomNavigationBar: Obx(() {
          return BottomAppBar(
            color: ConstantColors.secondColor.withOpacity(.2),
            elevation: 0,
            notchMargin: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bottomAppBarItem(
                    icon: IconlyLight.home,
                    page: 0,
                    context,
                    label: "Home",
                    currentPage: controller.currentPage,
                    onTap: () {
                      HapticFeedback.selectionClick();
                      controller.goToTab(0);
                    },
                  ),
                  FloatingActionButton(
                    onPressed: () async {
                      HapticFeedback.selectionClick();
                      print(await FirebaseMessaging.instance.getToken());
                      Get.to(
                        const AddparkingplaceView(),
                      );
                    },
                    child: const Icon(Icons.add),
                  ),
                  bottomAppBarItem(
                    icon: IconlyLight.setting,
                    page: 1,
                    context,
                    label: "Paramètre",
                    currentPage: controller.currentPage,
                    onTap: () {
                      HapticFeedback.selectionClick();
                      controller.goToTab(1);
                    },
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
