import 'package:flutter/material.dart';

import '../../utils/responsive.dart';
import 'widgets/header.dart';
import 'widgets/question.dart';

class DetailQuestionPage extends StatelessWidget {
  const DetailQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    return Scaffold(
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
                    const Question(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
