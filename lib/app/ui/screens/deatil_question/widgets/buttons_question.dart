import 'package:flutter/material.dart';

import '../../../utils/responsive.dart';

class ButtonsQuestion extends StatelessWidget {
  const ButtonsQuestion({Key? key, required this.idQuestion, required})
      : super(key: key);

  final int idQuestion;

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
            size: size.dp(2),
          ),
          onPressed: () {},
        ),
        Padding(
          padding: EdgeInsets.only(right: size.wp(2)),
          child: SizedBox(
            height: size.hp(3.2),
            width: size.wp(30),
            child: ElevatedButton.icon(
              icon: Icon(
                Icons.message_outlined,
                size: size.dp(1.8),
              ),
              label: Text(
                'Responder',
                style: TextStyle(
                  fontSize: size.dp(1.2),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
              onPressed: () {
                Map<String, dynamic> data = {
                  'estado': 'eliminar',
                  'id': idQuestion,
                };
                Navigator.pop(context, data);
              },
            ),
          ),
        ),
      ],
    );
  }
}
