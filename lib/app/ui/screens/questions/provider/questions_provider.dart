import 'package:flutter/material.dart';

class QuestionsProvider with ChangeNotifier {
  QuestionsProvider() {
    print("QUESTION PROVIDER CREATED");
  }

  final List<String> _l = [
    'TiendaMajo',
    'MiTienditaStore',
    'TiendaJuango',
    'VariedadesPipe02',
    'TuMiscelanea',
    'ImportNana',
    'ImportacionesTres',
    'ImportMuriel',
    'ImportChavo',
  ];

  List<String> get listShops => _l;
}
