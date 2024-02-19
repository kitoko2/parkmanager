import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:parkmanager/app/components/custom_button.dart';
import 'package:parkmanager/app/components/custom_text_form_field.dart';
import 'package:parkmanager/app/components/tige_popup.dart';
import 'package:parkmanager/app/models/parkingplace.dart';
import 'package:parkmanager/app/services/reservation_service/reservation_service.dart';
import 'package:parkmanager/utils/dialog.dart';

class MakeReservationBottomSheet
    extends GetView<MakeReservationBottomSheetController> {
  final ParkingPlace place;
  const MakeReservationBottomSheet({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MakeReservationBottomSheetController());
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
              "Vous voulez reserver cette place?",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, height: 1.2),
            ),
          ),
          const Divider(),
          const Text(
            "Entrez le nombre d'heures que vous souhaitez !",
            style: TextStyle(fontSize: 13),
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            hintText: "Ex : 2",
            controller: controller.nbrHoursController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 15),
          Center(
            child: CustomButton(
              width: double.infinity,
              title: "Reserver",
              onTap: () {
                controller.requestParkingReservation(place);
              },
            ),
          ),
          SizedBox(height: 5 + MediaQuery.of(context).padding.bottom),
        ].animate().slideY(delay: 200.ms, begin: 1).fadeIn(),
      ),
    ).animate().fadeIn().shimmer();
  }
}

class MakeReservationBottomSheetController extends GetxController {
  TextEditingController nbrHoursController = TextEditingController();
  requestParkingReservation(ParkingPlace place) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final numberOfHours = nbrHoursController.text.trim();

    if (numberOfHours.isEmpty || int.tryParse(numberOfHours) == null) {
      CustomDialog.alertDialog(
          description: "Le champs nombre d'heure n'est pas valide!");
      return;
    }

    CustomDialog.customLoad();
    final res = await ReservationService.requestParkingReservation(
        place.id!,
        userId,
        place.adminId!,
        int.parse(numberOfHours),
        "N ${place.placeNumber} , Etage ${place.etage}");
    Get.back();
    if (res.status == true) {
      CustomDialog.alertDialog(
          description: res.message ?? "",
          title: "Félicitation🥳",
          barrierDismissible: false,
          onTap: () {
            Get.close(2);
          });
    } else {
      CustomDialog.alertDialog(description: res.message ?? "");
    }
  }
}
