import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:parkmanager/utils/constants/constant_colors.dart';
import 'package:parkmanager/utils/constants/constant_strings.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ParkingButton extends StatelessWidget {
  final VoidCallback onTap;
  const ParkingButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      end: .99,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ConstantColors.secondColor),
        ),
        child: Row(children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ConstantColors.secondColor),
            ),
            child: LottieBuilder.asset(
              "assets/lotties/car.json",
              width: 100,
              repeat: false,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mon parking",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontFamily: ConstantString.secondpoliceApp,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  "Gérez votre parking , Ajouter, supprimer et affecter des places à vos utilisateurs",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
