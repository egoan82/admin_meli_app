import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              Expanded(
                flex: 2,
                child: Selector<QuestionsProvider, List<String>>(
                  selector: (_, c) => c.listShops,
                  builder: (_, listShops, __) {
                    return (listShops.isEmpty)
                        ? const SizedBox()
                        : GridView.count(
                            childAspectRatio: 1.2,
                            crossAxisCount: 3,
                            children: listShops
                                .map(
                                  (e) => Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            e,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: size.hp(1)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons
                                                    .clipboardQuestion,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                size: size.dp(4.4),
                                              ),
                                              Text(
                                                e.length.toString(),
                                                style: TextStyle(
                                                  fontSize: size.dp(2.8),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: FontsApp.subtitulos('Preguntas recientes', size),
              ),
              SizedBox(height: size.hp(1)),
              Expanded(
                flex: 2,
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
