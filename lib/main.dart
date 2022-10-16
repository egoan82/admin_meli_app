import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/ui/data/firebase/push_notifications_service.dart';
import 'app/ui/data/local/local_notifications_service.dart';
import 'app/ui/routes/routes.dart';

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
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    LocalNotificationsService.i.initialize();
    PushNotificationService.messagesStream.listen(
      (message) {
        // print('MyApp: $message');
        // navigatorKey.currentState?.pushNamed('message', arguments: message);

        final snackBar = SnackBar(content: Text(message));
        messengerKey.currentState?.showSnackBar(snackBar);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
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
      navigatorKey: navigatorKey, // Navegar
      scaffoldMessengerKey: messengerKey, // Snacks
      routes: appRoutes(),
      initialRoute: 'home',
    );
  }
}
