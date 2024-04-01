import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:parkmanager/utils/local_notification_service.dart';

Future<void> requestFCMPermissions() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');
}

void playSoundNotification(
    // NotificationModel notificationModel
    ) {
  // if (notificationModel.type == Notificationtype.reservation) {
  //   Get.toNamed(CustomerReservationListScreen.idScreen);
  // }
  // if (notificationModel.type == Notificationtype.reservation &&
  //     role == UserRole.PROFESSIONAL) {
  //   Get.toNamed(ProReservationListScreen.idScreen);
  // }
  // if (notificationModel.type == Notificationtype.reservation) {
  // print("===========PLAY SOUND=========");
  // final player = AudioPlayer();
  // player.play(AssetSource("reservation_opassage.mp3"));
  // }
}

listenFCMForegroundMessages() {
  // Executer quand l'utilisateur appuie sur la notification recu et que l'app est completement fermé
  FirebaseMessaging.instance.getInitialMessage().then((message) {
    print(
        '---------A new getInitialMessage event was published! ${message?.toMap()}---------');
    if (message != null) {}
  });

  final LocalNotificationService _localNotificationService =
      LocalNotificationService();
  _localNotificationService.initialize();

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    log("-----NOTIFICATION RECU----${message.toMap()}");
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message notif: ${message.notification!.toMap()}');
      print('Message also contained a notification: ${message.toMap()}');
      _localNotificationService.showNotification(message);
      playSoundNotification();
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('---------A new onMessageOpenedApp event was published!---------');
  });

  // Executer quand l'app est en background et que l'utilisateur recois une notif
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("-----NOTIF BQCKGROUND RECU----${message.toMap()}");
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
  playSoundNotification();
  // Get.toNamed(NotificationScreen.idScreen);
}
