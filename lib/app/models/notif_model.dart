import 'package:get/get.dart';

class NotificationModel {
  String sId;
  String title;
  String body;
  Rx<bool?>? isRead;
  NotificationModel(
      {required this.body,
      required this.sId,
      required this.title,
      required this.isRead});
}

List<NotificationModel> notifications = [
  NotificationModel(
    sId: "1",
    title: "Nouvelle reservation",
    body: "Une nouvelle personne a reservé votre place",
    isRead: false.obs,
  ),
  NotificationModel(
    sId: "2",
    title: "Nouvelle reservation",
    body: "Une nouvelle personne a reservé votre place",
    isRead: true.obs,
  ),
  NotificationModel(
    sId: "3",
    title: "Nouvelle reservation",
    body: "Une nouvelle personne a reservé votre place",
    isRead: true.obs,
  ),
];
