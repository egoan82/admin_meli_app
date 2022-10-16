import 'package:flutter/material.dart';

import '../../../../utils/responsive.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    return Container(
      height: size.hp(26),
      width: size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(size.dp(1.4)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Pregunta',
                    style: TextStyle(
                      fontSize: size.dp(4),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: size.wp(1)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Text(
                      "TiendaMajo",
                      style: TextStyle(
                        fontSize: size.dp(1.8),
                        color: Colors.white54,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.dp(1.4)),
              child: Text(
                "Cando 30-2390, Rodillo Redondo De 2 capas De Espuma, 6 X ",
                style: TextStyle(
                  fontSize: size.dp(1.8),
                  color: Colors.white54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
