import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkmanager/app/modules/onboarding/views/onboarding_view.dart';
import 'package:parkmanager/app/routes/app_pages.dart';
import 'package:parkmanager/app/services/storage.dart';
import 'package:parkmanager/stream_role.dart';

class SplashscreenController extends GetxController {
  bool asLogged = false;

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      asLogged = FirebaseAuth.instance.currentUser != null;
      bool hasOnboarded = SharedPreferencesService.getHasOnboarded();

      Timer(
        const Duration(milliseconds: 700),
        () async {
          hasOnboarded
              ? asLogged
                  ? Get.offAll(() => const StreamRoleView())
                  : Get.offAllNamed(Routes.AUTHENTICATION)
              : asLogged
                  ? Get.offAll(() => const StreamRoleView())
                  : Get.offAll(() => const OnboardingView());
        },
      );
    });

    super.onInit();
  }
}
