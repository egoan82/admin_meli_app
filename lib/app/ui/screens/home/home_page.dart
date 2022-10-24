import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/local/local_notifications_service.dart';
import '../../utils/responsive.dart';
import '../widgets/dialogs.dart';
import 'provider/home_provider.dart';
import 'widgets/menu_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo? androidInfo;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    androidInfo = await deviceInfo.androidInfo;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
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
              Text("Modelo: ${androidInfo == null ? '' : androidInfo!.model}"),
              Text("Marca: ${androidInfo == null ? '' : androidInfo!.brand}"),
              Text("Id: ${androidInfo == null ? '' : androidInfo!.id}"),
              Text(
                  "Dispositivo fisico: ${androidInfo == null ? '' : androidInfo!.isPhysicalDevice}"),
              Text(
                  "Version Android: ${androidInfo == null ? '' : androidInfo!.version.release}"),
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
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Mostrar loading'),
                onPressed: () async {
                  alertLoading(context, 'Cargando');
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Mostrar alerta'),
                onPressed: () async {
                  alertRequest(
                    context,
                    title: 'Titulo Dialogo',
                    height: size.hp(36),
                    widget: Column(
                      children: [
                        SizedBox(height: size.hp(2)),
                        Expanded(
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  label: const Text('Nombre corto'),
                                  enabledBorder: const OutlineInputBorder(
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
                                keyboardType: TextInputType.text,
                                maxLines: 3,
                                decoration: InputDecoration(
                                  label: const Text('Respuesta'),
                                  enabledBorder: const OutlineInputBorder(
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
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
