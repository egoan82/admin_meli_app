import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/questions_store_model.dart';
import '../../utils/responsive.dart';
import 'provider/detail_question_provider.dart';
import 'widgets/header.dart';
import 'widgets/question_page.dart';

class DetailQuestionPage extends StatelessWidget {
  const DetailQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    final q = ModalRoute.of(context)!.settings.arguments as Question;

    return ChangeNotifierProvider<DetailQuestionProvider>(
      create: (context) => DetailQuestionProvider(),
      builder: (context, child) {
        Provider.of<DetailQuestionProvider>(
          context,
          listen: false,
        ).q = q;
        return WillPopScope(
          onWillPop: () {
            Navigator.pop(context, 'eliminado');
            return Future.value(false);
          },
          child: Scaffold(
            body: Column(
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
          ),
        );
      },
    );
  }
}
