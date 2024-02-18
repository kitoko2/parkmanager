import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkmanager/app/modules/homepagepublic/views/homepagepublic_view.dart';

import '../../setting/views/setting_view.dart';

class HomepublicController extends GetxController {
  PageController pageController = PageController();
  RxInt currentPage = 0.obs;
  List<Widget> pages = [
    const HomepagepublicView(),
    const SettingView(
      isAdmin: false,
    ),
  ];

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }
}
