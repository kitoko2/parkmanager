import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:parkmanager/app/modules/addparkingplace/views/addparkingplace_view.dart';
import 'package:parkmanager/utils/constants/constant_colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _bottomAppBarItem(
                    icon: IconlyLight.home,
                    page: 0,
                    context,
                    label: "Home",
                  ),
                  // false
                  //     ? Visibility(
                  //         visible: false,
                  //         child: FloatingActionButton(
                  //           onPressed: () {},
                  //           elevation: 0,
                  //         ),
                  //       )
                  //     :
                  FloatingActionButton(
                    onPressed: () {
                      HapticFeedback.selectionClick();
                      Get.to(
                        const AddparkingplaceView(),
                      );
                    },
                    child: const Icon(Icons.add),
                  ),
                  _bottomAppBarItem(
                      icon: IconlyLight.setting,
                      page: 1,
                      context,
                      label: "Paramètre"),
                ],
              ),
            ),
          );
        }));
  }

  Widget _bottomAppBarItem(BuildContext context,
      {required icon, required page, required label}) {
    return ZoomTapAnimation(
      onTap: () {
        HapticFeedback.selectionClick();
        controller.goToTab(page);
      },
      child: Container(
        color: Colors.transparent,
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color:
                  controller.currentPage == page ? Colors.black : Colors.grey,
              size: 30,
            ),
            Text(
              label,
              style: TextStyle(
                  color: controller.currentPage == page
                      ? Colors.black
                      : Colors.grey,
                  fontSize: 13,
                  fontWeight:
                      controller.currentPage == page ? FontWeight.w600 : null),
            ),
          ],
        ),
      ),
    );
  }
}
