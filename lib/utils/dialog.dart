import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkmanager/app/components/custom_button.dart';
import 'package:parkmanager/app/models/parkingplace.dart';
import 'package:parkmanager/app/services/authentification_service/firestore_db_auth.dart';
import 'package:parkmanager/utils/constants/constant_strings.dart';

class CustomDialog {
  static customLoad() {
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  width: 70,
                  height: 70,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
            onWillPop: () async {
              return false;
            },
          );
        });
  }

  static customShowDialog({
    required String title,
    required String description,
    Widget? asset,
    required Widget actions,
  }) {
    return Get.defaultDialog(
      title: '',
      titlePadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          actions
        ],
      ),
    );
  }

  static alertDialog(
      {String? title,
      required String description,
      String? btnTitle,
      VoidCallback? onTap,
      bool? barrierDismissible = true}) {
    return Get.defaultDialog(
        title: title ?? "Un problème est survenue",
        barrierDismissible: barrierDismissible!,
        titleStyle: TextStyle(
          fontFamily: ConstantString.secondpoliceApp,
          fontWeight: FontWeight.bold,
        ),
        content: WillPopScope(
          onWillPop: () async {
            return barrierDismissible;
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                style: const TextStyle(
                  fontSize: 13,
                  // color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              CustomButton(
                  width: double.infinity,
                  title: btnTitle ?? "Compris !",
                  onTap: onTap ??
                      () {
                        Get.back();
                      })
            ],
          ),
        ));
  }

  static unassignedDialog(
      {required VoidCallback onTap,
      bool? barrierDismissible = true,
      required ParkingPlace place}) {
    return Get.defaultDialog(
        title: "",
        titlePadding: EdgeInsets.zero,
        barrierDismissible: barrierDismissible!,
        titleStyle: TextStyle(
          fontFamily: ConstantString.secondpoliceApp,
          fontWeight: FontWeight.bold,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
                future: DatabaseFirestore.getUserInfoByUUID(place.occupantId!),
                builder: (context, snap) {
                  final data = snap.data;
                  if (snap.hasData) {
                    return Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.person_sharp),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Occupé par",
                              style: TextStyle(
                                fontFamily: ConstantString.secondpoliceApp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              data?.email ?? "_",
                              style: const TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                      ],
                    );
                  }
                  return const CircularProgressIndicator();
                }),
            const SizedBox(height: 10),
            const Text(
              "Une fois désassignée, cette place sera à nouveau libre et pourra être réservée par d'autres utilisateurs.",
              style: TextStyle(
                fontSize: 13,
                // color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            CustomButton(
              width: double.infinity,
              title: "Désassigner",
              onTap: onTap,
            )
          ],
        ));
  }
}
