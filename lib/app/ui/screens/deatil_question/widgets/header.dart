import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/models/detail_mco_model.dart';
import '../../../utils/fonts.dart';
import '../../../utils/responsive.dart';
import '../provider/detail_question_provider.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    return Stack(
      children: [
        Container(
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
                        child: Selector<DetailQuestionProvider, String>(
                          selector: (_, c) => c.store,
                          builder: (_, store, __) {
                            return SizedBox(
                              width: size.wp(34),
                              child: Text(
                                FontsApp.capitalize(store),
                                style: TextStyle(
                                  fontSize: size.dp(1.8),
                                  color: Colors.white54,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size.dp(1.4)),
                  child: Selector<DetailQuestionProvider, DetailMco?>(
                    selector: (_, c) => c.mco,
                    builder: (_, mco, __) {
                      return Text(
                        (mco == null) ? 'No registra' : mco.title,
                        style: TextStyle(
                          fontSize: size.dp(1.8),
                          color: Colors.white54,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: size.hp(6),
          right: size.wp(2),
          child: Image.asset(
            'assets/adviser.png',
            height: size.hp(10),
          ),
        ),
      ],
    );
  }
}
