import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:parkmanager/app/components/custom_button.dart';
import 'package:parkmanager/app/components/tige_popup.dart';
import 'package:parkmanager/app/models/reservatiom_model.dart';
import 'package:parkmanager/app/services/reservation_service/reservation_service.dart';
import 'package:parkmanager/utils/dialog.dart';

class AcceptReservationBottomSheet
    extends GetView<AcceptReservationBottomSheetController> {
  final Reservation reservation;
  const AcceptReservationBottomSheet({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AcceptReservationBottomSheetController());
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
              "Voulez-vous accepter cette reservation?",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, height: 1.2),
            ),
          ),
          const Divider(),
          const Text(
            "L'utilisateur sera autorisé à se garer dans votre parking !",
            style: TextStyle(fontSize: 13),
          ),
          const SizedBox(height: 15),
          Center(
            child: CustomButton(
              width: double.infinity,
              title: "Valider la reservation",
              onTap: () {
                controller.acceptParkingReservation(reservation);
              },
            ),
          ),
          SizedBox(height: 5 + MediaQuery.of(context).padding.bottom),
        ].animate().slideY(delay: 200.ms, begin: 1).fadeIn(),
      ),
    ).animate().fadeIn().shimmer();
  }
}

class AcceptReservationBottomSheetController extends GetxController {
  acceptParkingReservation(Reservation reservation) async {
    Get.back();
    CustomDialog.customLoad();
    final res = await ReservationService.acceptParkingReservation(
      reservation.id!,
      reservation.userId!,
      reservation.placeId!,
      reservation.numberOfHours!,
    );
    Get.back();
    if (res.status == true) {
      CustomDialog.alertDialog(
        description: res.message ?? "",
        title: "Félicitation🥳",
        barrierDismissible: false,
        onTap: () {
          Get.close(2);
        },
      );
    } else {
      CustomDialog.alertDialog(description: res.message ?? "");
    }
  }
}
