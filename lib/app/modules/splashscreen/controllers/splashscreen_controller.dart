import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkmanager/app/modules/onboarding/views/onboarding_view.dart';
import 'package:parkmanager/app/routes/app_pages.dart';
import 'package:parkmanager/app/services/storage.dart';

class SplashscreenController extends GetxController {
  bool asLogged = false;

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      asLogged = false;
      bool hasOnboarded = SharedPreferencesService.getHasOnboarded();
      print(hasOnboarded);

      Timer(
        const Duration(milliseconds: 700),
        () async {
          hasOnboarded
              ? asLogged
                  ? Get.offAllNamed(Routes.HOME)
                  : Get.offAllNamed(Routes.AUTHENTICATION)
              : asLogged
                  ? Get.offAllNamed(Routes.HOME)
                  : Get.offAll(() => const OnboardingView());
        },
      );
    });

    super.onInit();
  }
}
