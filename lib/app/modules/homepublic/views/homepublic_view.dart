import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:parkmanager/app/components/bottom_bar_item.dart';
import 'package:parkmanager/utils/constants/constant_colors.dart';

import '../controllers/homepublic_controller.dart';

class HomepublicView extends GetView<HomepublicController> {
  const HomepublicView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomepublicController());
    return Scaffold(
        body: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: controller.pages,
        ),
        bottomNavigationBar: Obx(() {
          return BottomAppBar(
            color: Colors.deepPurple.withOpacity(.2),
            elevation: 0,
            notchMargin: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
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
