import 'package:flutter/material.dart';

import 'dialogs_type/alert_error.dart';
import 'dialogs_type/alert_loading.dart';
import 'dialogs_type/alert_request.dart';
import 'dialogs_type/alert_success.dart';

Future<void> alertLoading(
  BuildContext context,
  String title,
) async {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: ((context) => AlertLoading(
          title: title,
        )),
  );
}

Future<void> alertError(
  BuildContext context,
  String title,
  String subtitle, {
  String? ruta,
  VoidCallback? onPress,
}) async {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: ((context) => AlertError(
          title: title,
          subtitle: subtitle,
          ruta: ruta,
          onPressed: onPress,
        )),
  );
}

Future<void> alertSuccess(
  BuildContext context,
  String title,
  String subtitle, {
  String? ruta,
}) async {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: ((context) => AlertSuccess(
          title: title,
          subtitle: subtitle,
          ruta: ruta,
        )),
  );
}

Future<void> alertRequest(
  BuildContext context,
  String title,
  String subtitle, {
  String? ruta,
  VoidCallback? onPress,
}) async {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: ((context) => AlertRequest(
          title: title,
          subtitle: subtitle,
          ruta: ruta,
          onPressed: onPress,
        )),
  );
}
