import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:parkmanager/app/components/custom_logout_model.dart';
import 'package:parkmanager/utils/constants/constant_strings.dart';
import 'package:parkmanager/utils/utils_function.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: kToolbarHeight),
                Text(
                  "Mon parking \nTaux d'occupation : 50 %",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontFamily: ConstantString.secondpoliceApp,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const LinearProgressIndicator(
                  value: 0.5,
                ),
              ],
            ),
          ),
          const Divider(),
          SizedBox(height: 10),
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
