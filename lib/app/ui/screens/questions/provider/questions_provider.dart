import 'package:flutter/material.dart';

class QuestionsProvider with ChangeNotifier {
  QuestionsProvider();

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
      'color': Color(0xff31B93D),
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
}
