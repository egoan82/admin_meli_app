// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/widgets.dart';

import '../../../../domain/models/questions_store_model.dart';

class DetailQuestionProvider with ChangeNotifier {
  late Question _q;
  Question get q => _q;

  set q(Question q) {
    _q = q;
  }
}
