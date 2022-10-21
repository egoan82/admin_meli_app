abstract class DateCustom {
  static DateTime date(String d) {
    String dr = '';
    if (d.contains('T')) {
      final r = d.split('T');
      dr = '${r[0]} ${r[1].substring(0, 8)}';
    }

    final result = (dr.isNotEmpty) ? DateTime.parse(dr) : DateTime.parse(d);

    return result;
  }
}
