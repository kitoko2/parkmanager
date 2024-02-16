import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:parkmanager/app/components/notification_widget.dart';
import 'package:parkmanager/app/models/notif_model.dart';
import 'package:parkmanager/app/modules/notification/views/empty_notif_view.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes notifications'),
        centerTitle: true,
      ),
      body: notifications.isEmpty
          ? const EmptyNotifView()
          : ListView.builder(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, bottom: 60, top: 10),
              itemCount: notifications.length,
              itemBuilder: (context, i) {
                final notif = notifications[i];
                return Obx(() {
                  return CustomNotificationWidget(
                    notif: notif,
                    isRead: notif.isRead!.value!,
                    onTap: () {
                      HapticFeedback.selectionClick();
                      if (notif.isRead!.value == false) {
                        // si la notif n'a pas encore ete lu
                        controller.readNotification(notif);
                      }
                    },
                    onDismissDelete: () {
                      controller.deleteNotification(notif);
                    },
                  );
                });
              }),
    );
  }
}
