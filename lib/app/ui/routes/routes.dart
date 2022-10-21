import 'package:flutter/widgets.dart';

import '../screens/home/home_page.dart';
import '../screens/deatil_question/detail_question_page.dart';
import '../screens/login/login.dart';
import '../screens/questions/questions_page.dart';
import '../screens/splash/splash_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    'splash': (_) => const SplashPage(),
    'login': (_) => const LoginPage(),
    'home': (_) => const HomePage(),
    'questions': (_) => const QuestionsPage(),
    'detailquestion': (_) => const DetailQuestionPage(),
  };
}
