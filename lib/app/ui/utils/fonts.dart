import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'responsive.dart';

abstract class FontsApp {
  static Text titulos(String t, Responsive size) {
    return Text(
      t,
      style: GoogleFonts.inter(
        fontSize: size.dp(3),
        fontWeight: FontWeight.w500,
        color: ColoresApp.FONTCOLOR,
      ),
    );
  }

  static Text subtitulos(
    String t,
    Responsive size, {
    double fontSize = 2,
    Color color = ColoresApp.FONTCOLOR,
    TextOverflow? overflow,
    FontWeight? fontWeight,
  }) {
    return Text(
      t,
      style: GoogleFonts.inter(
        fontSize: size.dp(fontSize),
        color: color,
        fontWeight: fontWeight,
      ),
      overflow: overflow,
    );
  }

  static String firtsLetters(String s) {
    var words = s.split(' ');
    var result = '';
    if (words.length > 2) {
      result = words[0].substring(0, 1).toUpperCase() +
          words[2].substring(0, 1).toUpperCase();
    } else {
      result = words[0].substring(0, 1).toUpperCase() +
          words[1].substring(0, 1).toUpperCase();
    }
    return result;
  }

  static String capitalize(String s, {bool allWords = false}) {
    if (s.isEmpty) {
      return '';
    }
    s = s.trim();
    if (allWords) {
      var words = s.split(' ');
      var capitalized = [];
      for (var w in words) {
        capitalized.add(capitalize(w));
      }
      return capitalized.join(' ');
    } else {
      return s.substring(0, 1).toUpperCase() + s.substring(1).toLowerCase();
    }
  }

  static String camelCaseToUpperUnderscore(String s) {
    var sb = StringBuffer();
    var first = true;
    for (var rune in s.runes) {
      var char = String.fromCharCode(rune);
      if (isUpperCase(char) && !first) {
        sb.write('');
        sb.write(char.toUpperCase());
      } else {
        first = false;
        sb.write(char.toUpperCase());
      }
    }
    return sb.toString();
  }

  static String camelCaseToLowerUnderscore(String s) {
    var sb = StringBuffer();
    var first = true;
    for (var rune in s.runes) {
      var char = String.fromCharCode(rune);
      if (isUpperCase(char) && !first) {
        if (char != '_') {
          sb.write('');
        }
        sb.write(char.toLowerCase());
      } else {
        first = false;
        sb.write(char.toLowerCase());
      }
    }
    return sb.toString();
  }

  static bool isLowerCase(String s) {
    return s == s.toLowerCase();
  }

  static bool isUpperCase(String s) {
    return s == s.toUpperCase();
  }
}
