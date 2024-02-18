import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:parkmanager/app/components/custom_button.dart';
import 'package:parkmanager/app/components/tige_popup.dart';

class CustomLogoutModal extends StatelessWidget {
  final VoidCallback onTapBtn;
  const CustomLogoutModal({super.key, required this.onTapBtn});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TigePopUp(),
            const SizedBox(height: 15),
            SizedBox(
              width: Get.width - 100,
              child: const Text(
                "Déconnexion🥺",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const Text(
              "Voulez vous vraiment vous déconnecter?\nVous ne pourrez plus recevoir les notifications...",
            ),
            const SizedBox(height: 20),
            Center(
              child: CustomSecondaryButtom(
                width: double.infinity,
                onTap: onTapBtn,
                title: 'Déconnexion',
              ),
            ),
            SizedBox(height: 5 + MediaQuery.of(context).padding.bottom),
          ].animate().fadeIn().shimmer(),
        ),
      ),
    );
  }
}
