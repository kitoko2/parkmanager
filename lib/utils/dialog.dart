import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkmanager/app/components/custom_button.dart';
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

  static errorDialog(
      {String? title, required String description, String? btnTitle}) {
    return Get.defaultDialog(
        title: title ?? "Un problème est survenue",
        titleStyle: TextStyle(
          fontFamily: ConstantString.secondpoliceApp,
          fontWeight: FontWeight.bold,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            CustomButton(
                width: double.infinity,
                title: btnTitle ?? "Compris !",
                onTap: () {
                  Get.back();
                })
          ],
        ));
  }
}
