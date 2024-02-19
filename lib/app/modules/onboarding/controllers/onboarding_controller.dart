import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:parkmanager/app/modules/authentication/views/authentication_view.dart';
import 'package:parkmanager/app/modules/onboarding/views/onboarding_view.dart';
import 'package:parkmanager/app/services/storage.dart';

class OnboardingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  PageController pageController = PageController();
  late final AnimationController animationController;
  final curentpage = 0.obs;

  List<OnboardingItem> items = [
    OnboardingItem(
      description:
          "Les parkings sont desormains à votre porté, plus besoin de vous prendre la tête",
      image: "assets/onboarding/1.png",
      title: "Garez vous facilement dans",
      highlightText: "tous Abidjan là",
    ),
    OnboardingItem(
      title: "Trouvez rapidement des places disponibles",
      description:
          "Grâce à notre application, vous pouvez rapidement trouver des places de parking disponibles dans les parkings de Vinci, Indigo, et plus encore.",
      image: "assets/onboarding/2.png",
      highlightText: "avec nos partenaires",
    ),
    OnboardingItem(
      title: "Réservez votre place à l'avance",
      description:
          "Ne vous inquiétez plus de trouver une place de parking à la dernière minute",
      image: "assets/onboarding/3.png",
      highlightText: "Facilemennnt!",
    ),
  ];

  next() async {
    if (isLast()) {
      await endOnBoard();
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  endOnBoard() async {
    animationController.forward();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(200.ms, () async {
          await SharedPreferencesService.sethasOnboarded();
          Get.off(() => const AuthenticationView());
        });
      }
    });
  }

  @override
  void onInit() {
    animationController = AnimationController(vsync: this);
    pageController.addListener(() {
      curentpage.value = pageController.page!.toInt();
    });
    super.onInit();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  bool isLast() {
    return curentpage.value == items.length - 1;
  }
}
