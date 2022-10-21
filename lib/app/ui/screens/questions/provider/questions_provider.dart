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

  final List<Map<String, dynamic>> _l = [
    {
      'name': 'TiendaMajo',
      'picture':
          'https://mla-s1-p.mlstatic.com/951547-MLA44485067540_012021-O.jpg',
      'color': const Color(0xff31B93D),
    },
    {
      'name': 'MiTienditaStore',
      'picture':
          'https://mla-s2-p.mlstatic.com/608306-MLA42754111028_072020-O.jpg',
      'color': const Color(0xff31B93D),
    },
    {
      'name': 'TiendaJuango',
      'picture':
          'https://mla-s1-p.mlstatic.com/850940-MLA44582442415_012021-O.jpg',
      'color': const Color(0xff31B93D),
    },
    {
      'name': 'VariedadesPipe02',
      'picture':
          'https://mla-s1-p.mlstatic.com/854644-MLA45879438421_052021-O.jpg',
      'color': const Color(0xff31B93D),
    },
    {
      'name': 'TuMiscelanea',
      'picture':
          'https://mla-s2-p.mlstatic.com/942346-MLA46330517660_062021-O.jpg',
      'color': const Color(0xff31B93D),
    },
    {
      'name': 'ImportNana',
      'picture':
          'https://mla-s1-p.mlstatic.com/796070-MLA46598178904_072021-O.jpg',
      'color': const Color(0xffFFB656),
    },
    {
      'name': 'ImportacionesTres',
      'picture':
          'https://mla-s2-p.mlstatic.com/750430-MLA46708269000_072021-O.jpg',
      'color': const Color(0xff31B93D),
    },
    {
      'name': 'ImportMuriel',
      'picture':
          'https://mla-s2-p.mlstatic.com/680305-MLA49160900195_022022-O.jpg',
      'color': const Color(0xff31B93D),
    },
    {
      'name': 'ImportChavo',
      'picture':
          'https://mla-s2-p.mlstatic.com/781684-MLA49386553280_032022-O.jpg',
      'color': const Color(0xff31B93D),
    },
  ];

  List<Map<String, dynamic>> get listShops => _l;

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
    final String token = _sessionController.session.token;
    final String user = _sessionController.session.user;
    final result = await _api.getQuestions(user, token);

    if (result.item1 == RequestResponse.ok) {
      final json = jsonDecode(result.item2);

      print(result.item2);

      final list = List.from(json)
          .map(
            (e) => QuestionsStore.fromJson(e),
          )
          .toList();

      questions = list;
      totalStores = list.length;
      listQuestions = list[0].questions;
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
