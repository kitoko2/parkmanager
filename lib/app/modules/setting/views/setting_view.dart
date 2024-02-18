import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:parkmanager/app/components/custom_logout_model.dart';
import 'package:parkmanager/utils/constants/constant_colors.dart';
import 'package:parkmanager/utils/constants/constant_strings.dart';
import 'package:parkmanager/utils/utils_function.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  final bool? isAdmin;
  const SettingView({Key? key, this.isAdmin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isAdmin == true
              ? const ProfilAdminCard(occupancyPercentage: 50)
              : ProfilPublicUserCard(user: FirebaseAuth.instance.currentUser!),
          const Divider(),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text(
                    'Profil',
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () {
                    // Get.to(
                    //   const ProfilView(),
                    // );
                  },
                  trailing: const Icon(IconlyLight.arrow_right_2),
                ),
                ListTile(
                  title: const Text(
                    "Partager l'application",
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () {
                    UtilFunction.shareApk();
                  },
                  trailing: const Icon(IconlyLight.arrow_right_2),
                ),
                ListTile(
                  title: const Text(
                    'Nous contacter',
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () {
                    UtilFunction.sendWhatsappMessage("+2250787610716");
                  },
                  trailing: const Icon(IconlyLight.arrow_right_2),
                ),
                ListTile(
                  title: const Text(
                    'Déconnexion',
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () {
                    Get.bottomSheet(CustomLogoutModal(
                      onTapBtn: () {
                        controller.logout();
                      },
                    ));
                  },
                  trailing: const Icon(IconlyLight.arrow_right_2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilAdminCard extends StatelessWidget {
  final double occupancyPercentage;
  const ProfilAdminCard({super.key, required this.occupancyPercentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person_sharp),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mon parking",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 20,
                          fontFamily: ConstantString.secondpoliceApp,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text("Taux d'occupation : $occupancyPercentage %")
                ],
              ),
            ],
          ),
          const Spacer(),
          SimpleCircularProgressBar(
            size: 40,
            backStrokeWidth: 5,
            progressStrokeWidth: 5,
            valueNotifier: ValueNotifier(occupancyPercentage),
            backColor: ConstantColors.lightgrayColor,
            progressColors: const [ConstantColors.primaryColor],
          ),
        ],
      ),
    );
  }
}

class ProfilPublicUserCard extends StatelessWidget {
  final User user;
  const ProfilPublicUserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person_sharp),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mon profil",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 20,
                          fontFamily: ConstantString.secondpoliceApp,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text("${user.email}")
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
