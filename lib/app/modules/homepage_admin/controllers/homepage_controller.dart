import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:parkmanager/app/models/parkingplace.dart';
import 'package:parkmanager/app/services/reservation_service/reservation_service.dart';
import 'package:parkmanager/utils/dialog.dart';

class HomepageAdminController extends GetxController {
  late String uid;
  @override
  void onInit() {
    uid = FirebaseAuth.instance.currentUser!.uid;
    super.onInit();
  }

  unassignParkingPlace(ParkingPlace place) async {
    Get.back();

    if (place.reservationId == null) {
      CustomDialog.alertDialog(description: "Aucune reservation trouvée");
      return;
    }

    CustomDialog.customLoad();
    final res = await ReservationService.unassignParkingPlace(
        place.id!, place.reservationId!);
    Get.back();
    if (res.status == true) {
      CustomDialog.alertDialog(
          description: res.message!, title: "Félicitation🤩");
    } else {
      CustomDialog.alertDialog(description: res.message!);
    }
  }
}
