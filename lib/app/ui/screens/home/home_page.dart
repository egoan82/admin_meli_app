import 'dart:math';

import 'package:admin_meli_app/app/data/local/local_notifications_service.dart';
import 'package:flutter/material.dart';

import 'widgets/menu_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: const MenuDrawer(),
      body: Center(
        child: ElevatedButton(
          child: const Text('Mostrar notificacion'),
          onPressed: () async {
            LocalNotificationsService.i.showNotification(
              id: Random().nextInt(100),
              title: 'TiendaMajo',
              body: 'Tienes ${Random().nextInt(100)} ventas nuevas',
            );
          },
        ),
      ),
    );
  }
}
