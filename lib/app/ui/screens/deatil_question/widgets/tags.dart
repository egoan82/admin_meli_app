import 'package:flutter/material.dart';

import '../../../utils/responsive.dart';

class Tags extends StatelessWidget {
  const Tags({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    return Wrap(
      children: List.generate(
        18,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 2,
            vertical: 2,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.wp(2),
              vertical: size.hp(0.6),
            ),
            height: size.hp(2.6),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "Respuesta $index",
              style: TextStyle(
                fontSize: size.dp(1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
