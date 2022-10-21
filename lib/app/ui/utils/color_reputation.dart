import 'package:flutter/widgets.dart';

abstract class ColorReputation {
  static Color color(String color) {
    Color c = const Color(0xff31B93D);
    switch (color) {
      case '1_red':
        c = const Color(0xffFF605A);
        break;
      case '2_orange':
        c = const Color(0xffFFB656);
        break;
      case '3_yellow':
        c = const Color(0xffFEF045);
        break;
      case '4_light_green':
        c = const Color(0xffBBFF20);
        break;
      case '5_green':
        c = const Color(0xff31B93D);
        break;
      default:
    }
    return c;
  }
}
