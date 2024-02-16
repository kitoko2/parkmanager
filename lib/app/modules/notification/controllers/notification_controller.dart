import 'package:get/get.dart';

import '../../../models/notif_model.dart';

class NotificationController extends GetxController {
  readNotification(NotificationModel notificationModel) async {
    notificationModel.isRead!.value = true;
    // final res =
    //     await NotificationCustomerApi.readNotification(notificationModel.sId!);
    // if (kDebugMode) {
    //   print('Lecture effectué avec success : $res');
    // }
  }

  deleteNotification(NotificationModel notificationModel) async {
    final allNotifications = notifications;
    allNotifications
        .removeWhere((element) => element.sId == notificationModel.sId);
    // final res = await NotificationCustomerApi.deleteNotification(
    //     notificationModel.sId!);
    // if (kDebugMode) {
    //   print('Suppression effectué avec success : $res');
    // }
  }
}
