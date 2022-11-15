import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../domain/models/detail_mco_model.dart';
import '../../../utils/date_custom.dart';
import '../../../utils/responsive.dart';
import '../provider/detail_question_provider.dart';
import 'button_add_fast_answer.dart';
import 'buttons_question.dart';
import 'input_answer.dart';
import 'tags.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    final q = Provider.of<DetailQuestionProvider>(
      context,
      listen: false,
    ).q;
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
                const Divider(),
                Selector<DetailQuestionProvider, DetailMco?>(
                  selector: (_, c) => c.mco,
                  builder: (_, mco, __) {
                    return (mco == null)
                        ? LottieBuilder.asset(
                            'assets/no_image.json',
                            width: size.wp(50),
                            height: size.hp(20),
                          )
                        : SizedBox(
                            width: size.wp(90),
                            height: size.hp(20),
                            child: Stack(
                              children: [
                                Center(
                                  child: CachedNetworkImage(
                                    imageUrl: mco.picture,
                                    placeholder: (context, url) => Icon(
                                      Icons.image,
                                      color: Colors.grey,
                                      size: size.dp(20),
                                    ),
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.image,
                                      color: Colors.red.shade900,
                                      size: size.dp(20),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: Icon(
                                    Icons.local_shipping_outlined,
                                    color: (mco.freeShipping)
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                                if (!mco.dbExists)
                                  Positioned(
                                    right: size.wp(6),
                                    child: const Icon(
                                      Icons.sync_problem_outlined,
                                      color: Colors.red,
                                    ),
                                  ),
                              ],
                            ),
                          );
                  },
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Text(
                        q!.itemId,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () async {
                        String mco = q.itemId.split('MCO').join('MCO-');
                        final url = Uri.parse(
                          "https://articulo.mercadolibre.com.co/$mco-_JM",
                        );
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      onLongPress: () {
                        Clipboard.setData(
                          ClipboardData(text: q.itemId),
                        );

                        Fluttertoast.showToast(
                          msg: "MCO Copiado",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black.withOpacity(
                            0.6,
                          ),
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                    ),
                    Selector<DetailQuestionProvider, DetailMco?>(
                      selector: (_, c) => c.mco,
                      builder: (_, mco, __) {
                        return (mco == null)
                            ? const Text('No registra')
                            : InkWell(
                                child: Text(
                                  mco.sku,
                                  style: const TextStyle(
                                    color: Color(0xff092546),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () async {
                                  final url = Uri.parse(
                                    'https://www.amazon.com/dp/${mco.sku}',
                                  );
                                  await launchUrl(
                                    url,
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
                                onLongPress: () {
                                  Clipboard.setData(
                                    ClipboardData(text: mco.sku),
                                  );

                                  Fluttertoast.showToast(
                                    msg: "SKU Copiado",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black.withOpacity(
                                      0.6,
                                    ),
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                },
                              );
                      },
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
            const Text(
              'Pregunta',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                DateCustom.dateQuestions(q.dateCreated),
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
                      child: FaIcon(
                        FontAwesomeIcons.circleQuestion,
                        size: size.dp(4.6),
                      ),
                    ),
                    SizedBox(height: size.hp(0.6)),
                    Text(
                      q.from.id.toString(),
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
                    q.text,
                    style: TextStyle(fontSize: size.dp(1.3)),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            const Divider(),
            Stack(
              children: [
                Column(
                  children: [
                    const Text(
                      'Respuestas rapidas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    SizedBox(height: size.hp(1)),
                    const Tags(),
                  ],
                ),
                Positioned(
                  top: -size.hp(1.8),
                  right: 0,
                  child: const ButtonAddFastAnswer(),
                ),
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
                ButtonsQuestion(idQuestion: q.id),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
