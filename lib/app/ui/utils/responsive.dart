import 'package:flutter/material.dart';
import 'dart:math' as math;

class Responsive {
  double _width = 1.0;
  double _height = 1.0;
  double _diagonal = 1.0;

  double get width => _width;
  double get height => _height;
  double get diagonal => _diagonal;

  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _height = size.height;
    _width = size.width;
    _diagonal = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));
  }

  double hp(double percent) => _height * percent / 100;
  double wp(double percent) => _width * percent / 100;
  double dp(double percent) => _diagonal * percent / 100;
}
