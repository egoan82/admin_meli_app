import 'package:flutter/material.dart';

import '../../../utils/responsive.dart';
import '../../widgets/dialogs.dart';

class ButtonAddFastAnswer extends StatelessWidget {
  const ButtonAddFastAnswer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    return IconButton(
      icon: const Icon(Icons.add_circle),
      iconSize: size.dp(2),
      color: Colors.green,
      onPressed: () {
        alertRequest(
          context,
          title: 'Respuesta rapida',
          height: size.hp(36),
          widget: Column(
            children: [
              SizedBox(height: size.hp(2)),
              Expanded(
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(fontSize: size.dp(1.4)),
                      decoration: InputDecoration(
                        label: const Text('Nombre corto'),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black45,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black45,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: size.hp(1),
                          horizontal: size.wp(3),
                        ),
                      ),
                      validator: (value) {
                        return null;
                      },
                    ),
                    SizedBox(height: size.hp(1)),
                    TextFormField(
                      style: TextStyle(fontSize: size.dp(1.4)),
                      maxLines: 3,
                      decoration: InputDecoration(
                        label: const Text('Respuesta'),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black45,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black45,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: size.hp(1),
                          horizontal: size.wp(3),
                        ),
                      ),
                      validator: (value) {
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
