import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../domain/models/questions_store_model.dart';
import '../../../utils/responsive.dart';
import '../provider/questions_provider.dart';
import 'card_store.dart';

class ListStores extends StatelessWidget {
  const ListStores({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    return SizedBox(
      height: size.hp(30),
      child: Selector<QuestionsProvider, List<QuestionsStore>?>(
        selector: (_, c) => c.questions,
        builder: (_, questions, __) {
          return (questions == null || questions.isEmpty)
              ? Center(
                  child: LottieBuilder.asset(
                    'assets/no_store.json',
                    width: size.wp(60),
                  ),
                )
              : Builder(
                  builder: (context) => GridView.count(
                    childAspectRatio: 1.8,
                    crossAxisCount: 3,
                    children: questions
                        .map(
                          (e) => InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () => Provider.of<QuestionsProvider>(
                              context,
                              listen: false,
                            ).setlistQuestions(e.name),
                            child: CardStore(e: e),
                          ),
                        )
                        .toList(),
                  ),
                );
        },
      ),
    );
  }
}
