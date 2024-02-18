import 'package:flutter/material.dart';
import 'package:parkmanager/utils/constants/constant_colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double? width;
  final VoidCallback onTap;
  const CustomButton(
      {super.key, required this.title, required this.onTap, this.width});

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      end: .99,
      onTap: onTap,
      child: Container(
        width: width ?? 200,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: ConstantColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSecondaryButtom extends StatelessWidget {
  final String title;
  final double? width;
  final VoidCallback onTap;
  const CustomSecondaryButtom(
      {super.key, required this.title, required this.onTap, this.width});

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      end: .99,
      onTap: onTap,
      child: Container(
        width: width ?? 200,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: ConstantColors.primaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const SmallButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      end: .99,
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ConstantColors.primaryColor,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
