import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SplashscreenController());
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset("assets/splash.json"),
      ),
    );
  }
}
