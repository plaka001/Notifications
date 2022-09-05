import 'package:flutter/material.dart';
import 'package:notifications_app/screens/home_screen.dart';
import 'package:notifications_app/screens/message_screen.dart';
import 'package:notifications_app/services/push_notifications_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    PushNotificationService.messagesStream.listen((message) {
      print('My App: $message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomeScreen(),
        'message': (context) => const MessageScreen()
      },
    );
  }
}
