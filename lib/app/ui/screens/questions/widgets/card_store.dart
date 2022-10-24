import 'package:flutter/material.dart';

import '../../../../domain/models/questions_store_model.dart';
import '../../../utils/color_reputation.dart';
import '../../../utils/responsive.dart';

class CardStore extends StatelessWidget {
  const CardStore({
    Key? key,
    required this.e,
  }) : super(key: key);

  final QuestionsStore e;

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    return Card(
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: 6,
            decoration: BoxDecoration(
              color: ColorReputation.color(e.reputation),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              ),
            ),
          ),
          SizedBox(
            width: size.wp(26),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  SizedBox(
                    width: size.wp(24),
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
                  SizedBox(height: size.hp(0.3)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: size.hp(4),
                        width: size.wp(15),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            e.thumbnail,
                            height: size.hp(3),
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                              'assets/logo_meli.png',
                              height: size.hp(3),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: size.wp(1.2)),
                      Expanded(
                        child: Center(
                          child: Text(
                            e.questions.length.toString(),
                            style: TextStyle(
                              fontSize: size.dp(1.8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
