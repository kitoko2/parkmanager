import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parkmanager/app/components/custom_button.dart';
import 'package:parkmanager/app/components/tige_popup.dart';
import 'package:parkmanager/utils/choose_image.dart';
import 'package:parkmanager/utils/constants/constant_colors.dart';
import 'package:parkmanager/utils/dialog.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class BottomSheetUpdateParking
    extends GetView<BottomSheetUpdateParkingController> {
  const BottomSheetUpdateParking({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomSheetUpdateParkingController());
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
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
              "Changer les infos de votre parking",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, height: 1.2),
            ),
          ),
          const Divider(),
          const Text(
            "Vous avez la possibilité de changer le nom et l'image de votre parking",
            style: TextStyle(fontSize: 13),
          ),
          const SizedBox(height: 10),
          ZoomTapAnimation(
            end: .99,
            onTap: () {
              Get.defaultDialog(
                  titlePadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  title: "Choisir une source d'image pour votre parking",
                  titleStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  content: ImageSourceDialog(
                    onTapCamera: () async {
                      await controller.pickImage(ImageSource.camera);
                    },
                    onTapGallery: () async {
                      await controller.pickImage(ImageSource.gallery);
                    },
                  ));
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: ConstantColors.primaryColor,
                  ),
                ),
                height: 90,
                width: double.infinity,
                child: Obx(() {
                  return controller.file.value == null
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(IconlyLight.plus,
                                color: ConstantColors.primaryColor),
                            Text(
                              "Cliquer ici pour ajouter \nl'image de votre parking",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ConstantColors.primaryColor,
                              ),
                            ),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            controller.file.value!,
                            fit: BoxFit.cover,
                          ),
                        );
                })),
          ),
          const SizedBox(height: 15),
          Center(
            child: CustomButton(
              width: double.infinity,
              title: "Envoyer",
              onTap: () {
                controller.updateParking();
              },
            ),
          ),
          SizedBox(height: 5 + MediaQuery.of(context).padding.bottom),
        ].animate().slideY(delay: 200.ms, begin: 1).fadeIn(),
      ),
    ).animate().fadeIn().shimmer();
  }
}

class ImageSourceDialog extends StatelessWidget {
  final VoidCallback onTapCamera;
  final VoidCallback onTapGallery;

  const ImageSourceDialog(
      {super.key, required this.onTapCamera, required this.onTapGallery});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Theme(
            data: ThemeData(
              useMaterial3: true,
              colorScheme: const ColorScheme.light().copyWith(
                primary: ConstantColors.primaryColor,
              ),
            ),
            child: OutlinedButton(
              onPressed: onTapCamera,
              child: const Text('Caméra'),
            ),
          ),
          const SizedBox(width: 8),
          Theme(
            data: ThemeData(
              useMaterial3: true,
              colorScheme: const ColorScheme.light().copyWith(
                primary: ConstantColors.primaryColor,
              ),
            ),
            child: OutlinedButton(
              onPressed: onTapGallery,
              child: const Text('Galerie'),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheetUpdateParkingController extends GetxController {
  final file = Rx<File?>(null);

  pickImage(ImageSource imageSource) async {
    final res = await ChooseImage.getImage(imageSource);
    if (res != null) {
      file.value = res;
      Get.back();
    }
  }

  updateParking() async {
    CustomDialog.customLoad();
    await Future.delayed(const Duration(seconds: 2));
    Get.close(2);
    Fluttertoast.showToast(msg: 'Succes');
  }
}
