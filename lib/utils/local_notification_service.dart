import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialise le plugin de notifications locales
  void initialize() async {
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await _flutterLocalNotificationsPlugin
            .getNotificationAppLaunchDetails();
    final didNotificationLaunchApp =
        notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;

    print('local notif open app : $didNotificationLaunchApp');

    if (didNotificationLaunchApp) {
      var payload = notificationAppLaunchDetails!.notificationResponse;
      print(
          "------------------OUVERTURE DE L'APPLICATION AVEC LA LOCAL NOTIF $payload-----------------------------");
    } else {
      const InitializationSettings initializationSettings =
          InitializationSettings(
        android: AndroidInitializationSettings(
          '@drawable/ic_launcher',
        ),
        iOS: DarwinInitializationSettings(),
      );

      _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: localNotification,
        onDidReceiveBackgroundNotificationResponse: localNotificationBackground,
        // onSelectNotification: handleNotificationTapped,
      );
    }
  }

  // Affiche une notification locale
  Future<void> showNotification(RemoteMessage message) async {
    String title = message.notification?.title ?? "No Title";
    String body = message.notification?.body ?? "No Body";

    String? channelID = message.notification?.android?.channelId;

    print("==============$channelID");

    AndroidNotificationDetails androidnotificationDetails =
        AndroidNotificationDetails(
      channelID ?? "channel_id", // ID de la chaîne
      'channel_name $channelID', // Nom de la chaîne
      channelDescription:
          'channel_description $channelID', // Description de la chaîne
      importance: Importance.max,
      priority: Priority.high,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidnotificationDetails,
      iOS: DarwinNotificationDetails(
        sound: message.data["sound"] ?? "default",
      ),
    );

    await _flutterLocalNotificationsPlugin.show(
      0, // ID de la notification
      title, // Titre de la notification
      body, // Corps de la notification
      notificationDetails, // Détails de la notification
    );

    //   // Récupérer l'instance du AuthBloc
    // final authBloc = BlocProvider.of<AuthBloc>(context);

    // // Accéder à l'état actuel
    // final authState = authBloc.state;
  }
}

@pragma('vm:entry-point')
void localNotification(NotificationResponse details) async {
  print("local notification  ${details.id}");
}

@pragma('vm:entry-point')
void localNotificationBackground(NotificationResponse details) async {
  print(details.payload);
  print("eeeeeee BACKGROUND  ${details.id}");
}
