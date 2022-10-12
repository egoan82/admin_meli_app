import 'package:flutter/material.dart';

import 'app/ui/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
