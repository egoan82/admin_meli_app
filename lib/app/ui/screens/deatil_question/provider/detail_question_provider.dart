// ignore_for_file: unnecessary_getters_setters

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/models/detail_mco_model.dart';
import '../../../../domain/models/fast_answer_model.dart';
import '../../../../domain/models/questions_store_model.dart';
import '../../../../domain/repositories/questions_repository.dart';
import '../../../../domain/responses/request_response.dart';
import '../../../global_controller/session_controller.dart';

class DetailQuestionProvider with ChangeNotifier {
  final SessionController _sessionController = GetIt.I.get<SessionController>();
  final QuestionsRepository _api = GetIt.I.get<QuestionsRepository>();

  DetailQuestionProvider() {
    load();
  }

  Future<void> load() async {
    Future.delayed(Duration.zero).then(
      (value) async {
        loading = true;
        await getDetailMco();
        await getFastAnswer();
        loading = false;
      },
    );
  }

  late AnimationController _animationController;
  AnimationController get animationController => _animationController;

  set animationController(AnimationController controller) {
    _animationController = controller;
  }

  final TextEditingController _answerController = TextEditingController();
  TextEditingController get answerController => _answerController;

  String _store = 'No registra';
  String get store => _store;

  set store(String s) {
    _store = s;
  }

  Question? _q;
  Question? get q => _q;

  set q(Question? q) {
    _q = q;
  }

  DetailMco? _mco;
  DetailMco? get mco => _mco;

  set mco(DetailMco? m) {
    _mco = m;
    notifyListeners();
  }

  List<FastAnswer> _fastAnswer = [];
  List<FastAnswer> get fastAnswer => _fastAnswer;

  set fastAnswer(List<FastAnswer> f) {
    _fastAnswer = f;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;

  set loading(bool l) {
    _loading = l;
    notifyListeners();
  }

  Future<void> getDetailMco() async {
    final String token = _sessionController.session.token;
    final String user = _sessionController.session.user;
    final result = await _api.getDetailMco(
      user,
      token,
      q!.itemId,
      store,
    );

    if (result.item1 == RequestResponse.ok) {
      final json = jsonDecode(result.item2);

      mco = DetailMco.fromJson(json);
    }
  }

  Future<void> getFastAnswer() async {
    final String token = _sessionController.session.token;
    final String user = _sessionController.session.user;
    final result = await _api.getFastAnswer(
      user,
      token,
    );

    if (result.item1 == RequestResponse.ok) {
      final json = jsonDecode(result.item2);

      fastAnswer = List.from(json)
          .map(
            (e) => FastAnswer.fromJson(e),
          )
          .toList();
    }
  }
}
