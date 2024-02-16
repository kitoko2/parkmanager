import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:parkmanager/app/modules/authentication/views/authentication_view.dart';
import 'package:parkmanager/app/modules/onboarding/views/onboarding_view.dart';

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
      description:
          "Propriétaire ? Monétisez votre voiture en toute simplicité ! Gérez vos locations et augmentez vos revenus sans complications avec Allodriver.",
      image: "assets/onboarding/2.png",
      title: "Gagnez avec ",
      highlightText: "Allodriver",
    ),
    OnboardingItem(
      description:
          "Ressentez la liberté de conduire ! Allodriver offre une expérience exceptionnelle. Rejoignez-nous pour explorer le monde au volant avec plaisir",
      image: "assets/onboarding/3.png",
      title: "Explorez avec ",
      highlightText: "Allodriver",
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
        Future.delayed(400.ms, () async {
          // await SharedPreferencesService.sethasOnboarded();
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
