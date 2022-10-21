import 'package:admin_meli_app/app/ui/utils/date_custom.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/questions_store_model.dart';
import '../../utils/color_reputation.dart';
import '../../utils/fonts.dart';
import '../../utils/responsive.dart';
import 'provider/questions_provider.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    return ChangeNotifierProvider<QuestionsProvider>(
      create: (context) => QuestionsProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Preguntas'),
          centerTitle: true,
          elevation: 0,
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: size.wp(4),
                  top: size.hp(1.6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Tiendas',
                          style: TextStyle(
                            fontSize: size.dp(4),
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: size.wp(1)),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Selector<QuestionsProvider, int>(
                            selector: (_, c) => c.totalStores,
                            builder: (_, totalStores, __) {
                              return Text(
                                "($totalStores)",
                                style: TextStyle(
                                  fontSize: size.dp(1.8),
                                  color: Colors.black54,
                                ),
                                overflow: TextOverflow.ellipsis,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                  ],
                ),
              ),
              // SizedBox(height: size.hp(1)),
              SizedBox(
                height: size.hp(30),
                child: Selector<QuestionsProvider, List<QuestionsStore>?>(
                  selector: (_, c) => c.questions,
                  builder: (_, questions, __) {
                    return (questions == null)
                        ? const SizedBox()
                        : Builder(
                            builder: (context) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.count(
                                childAspectRatio: 1.2,
                                crossAxisCount: 4,
                                children: questions
                                    .map(
                                      (e) => InkWell(
                                        onTap: () =>
                                            Provider.of<QuestionsProvider>(
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
                                                  color: ColorReputation.color(
                                                      e.reputation),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft: Radius.circular(4),
                                                    bottomLeft:
                                                        Radius.circular(4),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      width: size.wp(16),
                                                      child: Text(
                                                        e.name,
                                                        style: TextStyle(
                                                          fontSize:
                                                              size.dp(1.2),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        overflow:
                                                            TextOverflow.fade,
                                                        maxLines: 1,
                                                        softWrap: false,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: size.hp(1)),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Image.network(
                                                          e.thumbnail,
                                                          height: size.hp(3),
                                                        ),
                                                        SizedBox(
                                                            width: size.wp(1)),
                                                        Text(
                                                          e.questions.length
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontSize:
                                                                size.dp(2),
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
                            ),
                          );
                  },
                ),
              ),
              SizedBox(height: size.hp(2)),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: FontsApp.subtitulos('Preguntas recientes', size),
              ),
              SizedBox(height: size.hp(1)),
              Expanded(
                flex: 3,
                child: Selector<QuestionsProvider, List<Question>?>(
                  selector: (_, c) => c.listQuestions,
                  builder: (_, listQuestions, __) {
                    return (listQuestions == null)
                        ? const SizedBox()
                        : ListView.builder(
                            itemCount: listQuestions.length,
                            itemBuilder: (context, index) {
                              final q = listQuestions[index];

                              // return ListTile(
                              //   leading: Image.network(q.thumbnail),
                              //   title: Text(
                              //     q.text,
                              //     overflow: TextOverflow.ellipsis,
                              //   ),
                              //   subtitle: Row(
                              //     children: [
                              //       Selector<QuestionsProvider, String>(
                              //         selector: (_, c) => c.store,
                              //         builder: (_, store, __) {
                              //           return Text(store);
                              //         },
                              //       ),
                              //       const Spacer(),
                              //       Text(
                              //         DateFormat('yyyy-MM-dd hh:mm a').format(
                              //             DateCustom.date(q.dateCreated)),
                              //         style: TextStyle(fontSize: size.dp(1)),
                              //       ),
                              //     ],
                              //   ),
                              //   trailing: const Icon(
                              //       Icons.keyboard_arrow_right_outlined),
                              //   onTap: () => Navigator.pushNamed(
                              //       context, 'detailquestion'),
                              // );

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: SizedBox(
                                  height: size.hp(10),
                                  width: size.wp(60),
                                  child: Card(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: size.hp(8),
                                          child: Image.network(
                                            q.thumbnail,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(width: size.wp(4)),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: size.hp(2)),
                                              Text(
                                                q.text,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const Spacer(),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  right: size.wp(2),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Selector<QuestionsProvider,
                                                        String>(
                                                      selector: (_, c) =>
                                                          c.store,
                                                      builder: (_, store, __) {
                                                        return Text(store);
                                                      },
                                                    ),
                                                    Text(
                                                      DateFormat(
                                                              'yyyy-MM-dd hh:mm a')
                                                          .format(
                                                              DateCustom.date(q
                                                                  .dateCreated)),
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
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () {
              Provider.of<QuestionsProvider>(
                context,
                listen: false,
              ).getQuestions();
            },
          ),
        ),
      ),
    );
  }
}
