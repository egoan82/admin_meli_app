import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../domain/models/questions_store_model.dart';
import '../../../utils/date_custom.dart';
import '../../../utils/fonts.dart';
import '../../../utils/responsive.dart';
import '../provider/questions_provider.dart';

class ListQuestions extends StatelessWidget {
  const ListQuestions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    return Selector<QuestionsProvider, List<Question>?>(
      selector: (_, c) => c.listQuestions,
      builder: (_, listQuestions, __) {
        return (listQuestions == null || listQuestions.isEmpty)
            ? Center(
                child: Column(
                  children: [
                    SizedBox(height: size.hp(4)),
                    LottieBuilder.asset(
                      'assets/no_questions.json',
                      width: size.wp(60),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: listQuestions.length,
                itemBuilder: (context, index) {
                  final q = listQuestions[index];

                  return SizedBox(
                    height: size.hp(12),
                    width: size.wp(60),
                    child: Card(
                      child: InkWell(
                        onTap: () async {
                          final r = await Navigator.pushNamed(
                            context,
                            'detailquestion',
                            arguments: q,
                          );

                          print(r);
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: size.hp(10),
                                width: size.wp(18),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.network(
                                  q.thumbnail,
                                  height: size.hp(6),
                                  width: size.wp(4),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: size.wp(1)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: size.hp(2)),
                                  Text(
                                    FontsApp.capitalize(q.text),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: size.wp(2),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Selector<QuestionsProvider, String>(
                                          selector: (_, c) => c.store,
                                          builder: (_, store, __) {
                                            return Text(
                                              store,
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.dp(1.2),
                                              ),
                                            );
                                          },
                                        ),
                                        Text(
                                          DateFormat('yyyy-MM-dd hh:mm a')
                                              .format(DateCustom.date(
                                                  q.dateCreated)),
                                          style: TextStyle(
                                            fontSize: size.dp(1.2),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: size.hp(1)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
