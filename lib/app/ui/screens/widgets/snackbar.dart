import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
SnackBar SnackBarWidget({
  required String msn,
  required String tipo,
  required Color colorCustom,
}) {
  IconData icon = (tipo == 'error') ? Icons.cancel : Icons.info;
  Color color = (tipo == 'error') ? Colors.red : colorCustom;

  return SnackBar(
    backgroundColor: color.withOpacity(0.9),
    elevation: 6.0,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
    content: Row(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            msn,
            textAlign: TextAlign.justify,
            maxLines: 2,
          ),
        ),
      ],
    ),
  );
}
