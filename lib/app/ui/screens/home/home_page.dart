import 'dart:math';

import 'package:admin_meli_app/app/data/local/local_notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/session.dart';
import 'provider/home_provider.dart';
import 'widgets/menu_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (context) => HomeProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
          elevation: 0,
        ),
        drawer: const MenuDrawer(),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Selector<HomeProvider, Session?>(
                selector: (_, c) => c.session,
                builder: (_, session, __) {
                  return Text(session?.user ?? '');
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Mostrar notificacion'),
                onPressed: () async {
                  LocalNotificationsService.i.showNotification(
                    id: Random().nextInt(100),
                    title: 'TiendaMajo',
                    body: 'Tienes ${Random().nextInt(100)} ventas nuevas',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
