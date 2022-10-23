// ignore_for_file: unnecessary_getters_setters

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/models/questions_store_model.dart';
import '../../../../domain/repositories/questions_repository.dart';
import '../../../../domain/responses/request_response.dart';
import '../../../global_controller/session_controller.dart';

class QuestionsProvider with ChangeNotifier {
  final SessionController _sessionController = GetIt.I.get<SessionController>();
  final QuestionsRepository _api = GetIt.I.get<QuestionsRepository>();

  QuestionsProvider() {
    getQuestions();
  }

  bool _loading = false;
  bool get loading => _loading;

  set loading(bool l) {
    _loading = l;
    notifyListeners();
  }

  late AnimationController _animationController;
  AnimationController get animationController => _animationController;

  set animationController(AnimationController controller) {
    _animationController = controller;
  }

  List<QuestionsStore>? _questions;
  List<QuestionsStore>? get questions => _questions;

  set questions(List<QuestionsStore>? l) {
    _questions = l;
    notifyListeners();
  }

  int _totalStores = 0;
  int get totalStores => _totalStores;

  set totalStores(int t) {
    _totalStores = t;
    notifyListeners();
  }

  List<Question>? _listQuestions;
  List<Question>? get listQuestions => _listQuestions;

  set listQuestions(List<Question>? l) {
    _listQuestions = l;
    notifyListeners();
  }

  String _store = '';
  String get store => _store;

  set store(String s) {
    _store = s;
    notifyListeners();
  }

  Future<void> getQuestions() async {
    loading = true;

    final String token = _sessionController.session.token;
    final String user = _sessionController.session.user;
    final result = await _api.getQuestions(user, token);

    loading = false;

    if (result.item1 == RequestResponse.ok) {
      final json = jsonDecode(result.item2);

      final list = List.from(json)
          .map(
            (e) => QuestionsStore.fromJson(e),
          )
          .toList();

      questions = list;
      totalStores = list.length;
      listQuestions = list[0].questions;
      store = list[0].name;
    }
  }

  void setlistQuestions(String l) {
    if (questions != null) {
      for (var element in questions!) {
        if (element.name == l) {
          listQuestions = element.questions;
          store = l;
        }
      }
    }
  }
}
