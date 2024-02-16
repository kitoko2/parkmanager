import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkmanager/app/modules/homepage/views/homepage_view.dart';
import 'package:parkmanager/app/modules/setting/views/setting_view.dart';

class HomeController extends GetxController {
  PageController pageController = PageController();
  RxInt currentPage = 0.obs;

  List<Widget> pages = [
    const HomepageView(),
    const SettingView(),
  ];

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }
}
