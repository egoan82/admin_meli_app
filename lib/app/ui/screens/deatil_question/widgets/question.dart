import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/responsive.dart';
import 'buttons_question.dart';
import 'input_answer.dart';
import 'tags.dart';

class Question extends StatelessWidget {
  const Question({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.dp(2),
          vertical: size.dp(1),
        ),
        child: Column(
          children: [
            Column(
              children: [
                const Text(
                  'Producto',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // const Divider(),
                // const ImagesProduct(),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: const Text(
                        'MCO654469331',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () async {
                        final url = Uri.parse(
                          'https://articulo.mercadolibre.com.co/MCO-654469331-_JM',
                        );
                        await launchUrl(url);
                      },
                    ),
                    InkWell(
                      child: const Text(
                        'B01B8GWKL6',
                        style: TextStyle(
                          color: Color(0xff092546),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () async {
                        final url =
                            Uri.parse('https://www.amazon.com/dp/B01B8GWKL6');
                        await launchUrl(url);
                      },
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                DateTime.now().toString().substring(0, 19),
                style: TextStyle(
                  fontSize: size.dp(1),
                  color: Colors.black54,
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: size.dp(3),
                      child: FlutterLogo(
                        size: size.dp(4),
                      ),
                    ),
                    SizedBox(height: size.hp(0.6)),
                    Text(
                      'Comprador',
                      style: TextStyle(
                        fontSize: size.dp(1),
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Tienes disponible el producto para entrega inmediata, me interesa conocer las medidas, color y capacidad que tenga el producto.",
                    style: TextStyle(fontSize: size.dp(1.2)),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            const Divider(),
            Column(
              children: [
                const Text(
                  'Respuestas rapidas',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.hp(1.4)),
                const Tags(),
              ],
            ),
            const Divider(),
            Column(
              children: [
                const InputAnswer(),
                Padding(
                  padding: EdgeInsets.only(
                    top: 4.0,
                    right: size.wp(4),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('0/360',
                        style: TextStyle(
                          fontSize: size.dp(1),
                          color: Colors.black54,
                        )),
                  ),
                ),
                const ButtonsQuestion(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
