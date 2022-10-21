import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../domain/models/questions_store_model.dart';
import '../../../utils/color_reputation.dart';
import '../../../utils/responsive.dart';
import '../provider/questions_provider.dart';

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
                    childAspectRatio: 1.2,
                    crossAxisCount: 4,
                    children: questions
                        .map(
                          (e) => InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () => Provider.of<QuestionsProvider>(
                              context,
                              listen: false,
                            ).setlistQuestions(e.name),
                            child: Card(
                              child: Row(
                                children: [
                                  Container(
                                    height: double.infinity,
                                    width: 6,
                                    decoration: BoxDecoration(
                                      color:
                                          ColorReputation.color(e.reputation),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4),
                                        bottomLeft: Radius.circular(4),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: size.wp(16),
                                          child: Text(
                                            e.name,
                                            style: TextStyle(
                                              fontSize: size.dp(1.2),
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.fade,
                                            maxLines: 1,
                                            softWrap: false,
                                          ),
                                        ),
                                        SizedBox(height: size.hp(1)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.network(
                                              e.thumbnail,
                                              height: size.hp(3),
                                            ),
                                            SizedBox(width: size.wp(1)),
                                            Text(
                                              e.questions.length.toString(),
                                              style: TextStyle(
                                                fontSize: size.dp(2),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
