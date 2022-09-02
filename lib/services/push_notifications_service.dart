import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging message = FirebaseMessaging.instance;
  static String? token;

  static Future<void> _onMessageHandler(RemoteMessage message) async {}

  static Future<void> _backgraundHandler(RemoteMessage message) async {}

  static Future<void> _onOpenMessageOpenApp(RemoteMessage message) async {}

  static Future initializeApp() async {
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('token; $token');
    FirebaseMessaging.onBackgroundMessage(_backgraundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onOpenMessageOpenApp);
  }
}
