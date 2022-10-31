import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/models/fast_answer_model.dart';
import '../../../utils/responsive.dart';
import '../provider/detail_question_provider.dart';

class Tags extends StatelessWidget {
  const Tags({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);

    return Selector<DetailQuestionProvider, List<FastAnswer>>(
      selector: (_, c) => c.fastAnswer,
      builder: (_, fastAnswer, __) {
        return Wrap(
          children: (fastAnswer.isEmpty)
              ? []
              : fastAnswer
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 2,
                        vertical: 2,
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Provider.of<DetailQuestionProvider>(
                            context,
                            listen: false,
                          ).answerController.text = e.respuesta;
                        },
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
                            e.nombre,
                            style: TextStyle(
                              fontSize: size.dp(1),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
        );
      },
    );
  }
}
