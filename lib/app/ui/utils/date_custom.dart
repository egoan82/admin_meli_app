import 'package:intl/intl.dart';

abstract class DateCustom {
  static String dateQuestions(String d) {
    final result =
        DateFormat('yyyy-MM-dd hh:mm a').format(DateTime.parse(d).toLocal());

    return result;
  }
}
