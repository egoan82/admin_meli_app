import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/ui/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  String? token = await FirebaseMessaging.instance.getToken();
  print(token);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Meli',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff3A97D5),
          secondary: const Color(0xff282F3A),
          background: const Color(0xff282F3A).withOpacity(0.2),
        ),
      ),
      routes: appRoutes(),
      initialRoute: 'home',
    );
  }
}
