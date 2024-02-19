import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkmanager/app/services/parking_service.dart/parking_management.dart';
import 'package:parkmanager/utils/dialog.dart';

class AddparkingplaceController extends GetxController {
  TextEditingController numberPlaceController = TextEditingController();
  TextEditingController etagePlaceController = TextEditingController();

  createParkingPlace() async {
    final placeNumber = numberPlaceController.text;
    final etage = etagePlaceController.text;

    final adminId = FirebaseAuth.instance.currentUser!.uid;

    if (placeNumber.trim().isEmpty || etage.trim().isEmpty) {
      CustomDialog.alertDialog(
          description: "Veuillez remplir le numéro et l'etage de la place",
          title: "Champ(s) invalides(s)");
      return;
    }

    CustomDialog.customLoad();
    final res = await ParkingManagementService.createParkingPlace(
        int.parse(placeNumber), int.parse(etage), adminId);
    Get.back();
    if (res.status == true) {
      CustomDialog.alertDialog(
          description: "Vous avez ajouté une place de parking avec succès.",
          title: "Félicitations🥳",
          barrierDismissible: false,
          btnTitle: "Continuer",
          onTap: () {
            Get.close(2);
          });
    } else {
      CustomDialog.alertDialog(description: res.message ?? "");
    }
  }
}
