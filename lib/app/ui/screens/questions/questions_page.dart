import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/fonts.dart';
import '../../utils/responsive.dart';
import 'provider/questions_provider.dart';
import 'widgets/list_questions.dart';
import 'widgets/list_stores.dart';
import 'widgets/title_count_stores.dart';

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
        body: Padding(
          padding: EdgeInsets.only(
            left: size.wp(4),
            top: size.hp(1.6),
            right: size.wp(4),
          ),
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleCountStores(),
                // SizedBox(height: size.hp(1)),
                const ListStores(),
                SizedBox(height: size.hp(2)),
                FontsApp.subtitulos('Preguntas recientes', size),
                const Divider(),
                SizedBox(height: size.hp(1)),
                const Expanded(
                  flex: 3,
                  child: ListQuestions(),
                ),
              ],
            ),
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
