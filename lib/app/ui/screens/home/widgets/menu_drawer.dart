// ignore_for_file: use_build_context_synchronously

import 'package:admin_meli_app/app/ui/screens/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          const Spacer(),
          ElevatedButton.icon(
            icon: const Icon(Icons.logout),
            label: const Text('Salir'),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(
                  horizontal: size.wp(10),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.secondary,
              ),
            ),
            onPressed: () async {
              await Provider.of<HomeProvider>(
                context,
                listen: false,
              ).logout();

              Navigator.pushNamedAndRemoveUntil(
                context,
                'login',
                (route) => false,
              );
            },
          )
        ],
      ),
    );
  }
}
