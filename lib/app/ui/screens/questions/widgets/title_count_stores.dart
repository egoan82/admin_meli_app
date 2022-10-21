import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/responsive.dart';
import '../provider/questions_provider.dart';

class TitleCountStores extends StatelessWidget {
  const TitleCountStores({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    return Column(
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
    );
  }
}
