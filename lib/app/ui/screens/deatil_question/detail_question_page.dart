// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/questions_store_model.dart';
import '../../utils/responsive.dart';
import '../widgets/dialogs_type/alert_loading.dart';
import 'provider/detail_question_provider.dart';
import 'widgets/header.dart';
import 'widgets/question_page.dart';

class DetailQuestionPage extends StatelessWidget {
  const DetailQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final q = args['question'] as Question;
    final s = args['store'] as String;

    return ChangeNotifierProvider<DetailQuestionProvider>(
      create: (context) => DetailQuestionProvider(),
      builder: (context, child) {
        final _controller = Provider.of<DetailQuestionProvider>(
          context,
          listen: false,
        );
        _controller.q = q;
        _controller.store = s;

        return WillPopScope(
          onWillPop: () {
            Navigator.pop(context, 'eliminado');
            return Future.value(false);
          },
          child: Scaffold(
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Stack(
                children: [
                  Column(
                    children: [
                      const Header(),
                      SizedBox(height: size.hp(1)),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.wp(2),
                            ),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const QuestionPage(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Selector<DetailQuestionProvider, bool>(
                    selector: (_, c) => c.loading,
                    builder: (_, loading, __) {
                      return (!loading)
                          ? const SizedBox()
                          : const AlertLoading(title: 'Cargando');
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
