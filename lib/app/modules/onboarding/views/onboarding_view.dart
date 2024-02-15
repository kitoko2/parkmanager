import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:parkmanager/app/components/custom_button.dart';
import 'package:parkmanager/utils/constants/constant_colors.dart';
import 'package:parkmanager/utils/constants/constant_strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                      controller: controller.pageController,
                      itemCount: controller.items.length,
                      itemBuilder: (context, i) {
                        final item = controller.items[i];
                        return OnboardingItemPage(
                          item: item,
                        );
                      }),
                ),
                const SizedBox(height: 30),
                SmoothPageIndicator(
                  controller: controller.pageController, // PageController
                  count: controller.items.length,
                  effect: ExpandingDotsEffect(
                    expansionFactor: 2,
                    dotColor: ConstantColors.secondColor,
                    activeDotColor: Theme.of(context).colorScheme.primary,
                    dotWidth: 10,
                    dotHeight: 7,
                    spacing: 3,
                  ),
                ),
                const SizedBox(height: 30),
                PhysicalModel(
                  elevation: 10,
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 20,
                        bottom: 20 + MediaQuery.of(context).padding.bottom),
                    child: Center(
                      child: Obx(() {
                        return CustomButton(
                          title: controller.isLast() ? "Terminer" : "Suivant",
                          onTap: controller.next,
                        );
                      }),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 10 + MediaQuery.of(context).padding.top,
            right: 20,
            child: Obx(() {
              return controller.isLast()
                  ? const SizedBox()
                  : GestureDetector(
                      onTap: controller.endOnBoard,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: ConstantColors.primaryColor,
                          ),
                        ),
                        child: const Text(
                          "Passer",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: ConstantColors.primaryColor,
                          ),
                        ),
                      ).animate().scale().fadeIn(),
                    );
            }),
          )
        ],
      )
          .animate(
            autoPlay: false,
            controller: controller.animationController,
          )
          .blurXY(begin: 0, end: 25, duration: 600.ms, curve: Curves.easeInOut)
          .scaleXY(begin: 1, end: 0.6)
          .fadeOut(
            begin: 1,
          ),
    );
  }
}

class OnboardingItem {
  final String? image;
  final String? title;
  final String? highlightText;
  final String? description;

  OnboardingItem(
      {required this.description,
      required this.image,
      required this.title,
      required this.highlightText});
}

class OnboardingItemPage extends StatelessWidget {
  final OnboardingItem item;
  const OnboardingItemPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          SizedBox(
            height: Get.height / 2,
            child: Image.asset(
              item.image!,
              width: 300,
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              Container(
                child: Text(
                  item.title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: ConstantString.secondpoliceApp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                item.highlightText!,
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: ConstantString.secondpoliceApp,
                    fontWeight: FontWeight.bold,
                    color: ConstantColors.primaryColor),
              ).animate().scale().shake(
                    delay: const Duration(milliseconds: 400),
                  )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            item.description!,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
