import 'package:flutter/material.dart';

import '../../../utils/fonts.dart';
import '../../../utils/responsive.dart';

class AlertRequest extends StatelessWidget {
  const AlertRequest({
    Key? key,
    this.okOnPressed,
    required this.widget,
    required this.title,
    this.height = 100,
  }) : super(key: key);

  final VoidCallback? okOnPressed;
  final Widget widget;
  final double height;
  final String title;

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: WillPopScope(
        onWillPop: () => Future.value(false),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: height,
                  width: size.wp(80),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.wp(6),
                      vertical: size.hp(2),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(height: size.hp(4)),
                              FontsApp.subtitulos(
                                title,
                                size,
                                fontWeight: FontWeight.w600,
                              ),
                              Expanded(child: widget),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.red,
                                ),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(
                                  horizontal: size.wp(8),
                                )),
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancelar'),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Theme.of(context).colorScheme.primary,
                                ),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(
                                  horizontal: size.wp(8.6),
                                )),
                              ),
                              onPressed: () => okOnPressed,
                              child: const Text('Aceptar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -size.hp(6),
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: size.dp(5),
                    child: Icon(
                      Icons.playlist_add_circle_outlined,
                      color: Colors.white,
                      size: size.hp(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
