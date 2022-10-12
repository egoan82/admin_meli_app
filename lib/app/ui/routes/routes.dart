import 'package:flutter/widgets.dart';

import '../screens/home/home_page.dart';
import '../screens/questions/questions_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    'home': (_) => const HomePage(),
    'questions': (_) => const QuestionsPage(),
  };
}
