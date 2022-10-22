// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';

import '../../utils/fonts.dart';
import '../../utils/responsive.dart';
import '../widgets/dialogs_type/alert_loading.dart';
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
      child: Stack(
        children: [
          Scaffold(
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
                child: Spin(
                  animate: false,
                  controller: (controller) => Provider.of<QuestionsProvider>(
                    context,
                    listen: false,
                  ).animationController = controller,
                  child: const Icon(Icons.refresh),
                ),
                onPressed: () async {
                  final controller = Provider.of<QuestionsProvider>(
                    context,
                    listen: false,
                  );
                  controller.animationController.reset();
                  controller.animationController.repeat();
                  await controller.getQuestions();
                  controller.animationController.stop();
                },
              ),
            ),
          ),
          Selector<QuestionsProvider, bool>(
            selector: (_, c) => c.loading,
            builder: (_, loading, __) {
              return (!loading)
                  ? const SizedBox()
                  : const AlertLoading(title: 'Cargando');
            },
          )
        ],
      ),
    );
  }
}
