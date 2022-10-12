import 'package:flutter/material.dart';

import '../../../utils/fonts.dart';
import '../../../utils/responsive.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    return Drawer(
      child: Column(
        children: [
          Container(
            height: size.hp(22),
            width: double.infinity,
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: size.hp(4)),
                Container(
                  height: size.hp(10),
                  width: size.wp(60),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/logo_white.png'),
                  ),
                ),
                FontsApp.subtitulos(
                  'Edward Gómez',
                  size,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Preguntas'),
            subtitle: const Text(
              'Listado de preguntas pendientes',
              overflow: TextOverflow.ellipsis,
            ),
            leading: Icon(
              Icons.question_mark_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            dense: true,
            minLeadingWidth: size.wp(6),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'questions');
            },
          ),
        ],
      ),
    );
  }
}
