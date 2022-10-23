import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/responsive.dart';
import '../provider/detail_question_provider.dart';

class InputAnswer extends StatelessWidget {
  const InputAnswer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    return Container(
      height: size.hp(10),
      width: size.wp(90),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 0,
      ),
      child: TextFormField(
        controller: Provider.of<DetailQuestionProvider>(
          context,
          listen: false,
        ).answerController,
        maxLines: 6,
        style: TextStyle(fontSize: size.dp(1.4)),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Escribe tu respuesta',
          hintStyle: TextStyle(
            color: Colors.black26,
          ),
        ),
      ),
    );
  }
}
