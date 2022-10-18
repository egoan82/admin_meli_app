import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
                padding: const EdgeInsets.all(12.0),
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
                          child: Text(
                            "(9)",
                            style: TextStyle(
                              fontSize: size.dp(1.8),
                              color: Colors.black54,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                  ],
                ),
              ),
              // SizedBox(height: size.hp(1)),
              Expanded(
                flex: 2,
                child: Selector<QuestionsProvider, List<Map<String, dynamic>>>(
                  selector: (_, c) => c.listShops,
                  builder: (_, listShops, __) {
                    return (listShops.isEmpty)
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.count(
                              childAspectRatio: 1.4,
                              crossAxisCount: 4,
                              children: listShops
                                  .map(
                                    (e) => Card(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: double.infinity,
                                            width: 6,
                                            decoration: BoxDecoration(
                                              color: e['color'],
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4),
                                                bottomLeft: Radius.circular(4),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  width: size.wp(16),
                                                  child: Text(
                                                    e['name'],
                                                    style: TextStyle(
                                                      fontSize: size.dp(1.2),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    overflow: TextOverflow.fade,
                                                    maxLines: 1,
                                                    softWrap: false,
                                                  ),
                                                ),
                                                SizedBox(height: size.hp(1)),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Image.network(
                                                      e['picture'],
                                                      height: size.hp(3),
                                                    ),
                                                    SizedBox(width: size.wp(1)),
                                                    Text(
                                                      e['name']
                                                          .length
                                                          .toString(),
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
                                  )
                                  .toList(),
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
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Pregunta $index'),
                      subtitle: Row(
                        children: [
                          const Text('NombreTienda'),
                          const Spacer(),
                          Text(DateFormat("yyyy-MM-dd h:mm:ss a")
                              .format(DateTime.now())),
                        ],
                      ),
                      trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                      onTap: () =>
                          Navigator.pushNamed(context, 'detailquestion'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
