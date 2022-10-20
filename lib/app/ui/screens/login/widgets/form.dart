// ignore_for_file: use_build_context_synchronously, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/responses/request_response.dart';
import '../../../utils/fonts.dart';
import '../../../utils/responsive.dart';
import '../../widgets/dialogs.dart';
import '../../widgets/snackbar.dart';
import '../controller/login_controller.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    Key? key,
  }) : super(key: key);

  void _submit(BuildContext context) async {
    final controller = Provider.of<LoginController>(
      context,
      listen: false,
    );

    final user = controller.user;
    final pass = controller.pass;

    if (user.text.isEmpty) {
      final snackBar = SnackBarWidget(
        msn: 'Por ingrese su usuario',
        tipo: 'error',
        colorCustom: Theme.of(context).colorScheme.primary,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    if (pass.text.isEmpty) {
      final snackBar = SnackBarWidget(
        msn: 'Por favor ingrese su contraseña',
        tipo: 'error',
        colorCustom: Theme.of(context).colorScheme.primary,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    alertLoading(context, 'Procesando');

    final result = await controller.login();

    if (result == RequestResponse.ok) {
      Navigator.pop(context);
      // Navigator.pushReplacementNamed(context, 'home');
    } else {
      Navigator.pop(context);

      switch (result) {
        case RequestResponse.accessDenied:
          alertError(context, 'Oops', 'Acceso no autorizado');
          break;
        case RequestResponse.networkError:
          alertError(context, 'Oops', 'Error de conexión');
          break;

        default:
          alertError(context, 'Error', 'Error de sistema');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    final controller = Provider.of<LoginController>(
      context,
      listen: false,
    );

    return Positioned.fill(
      top: size.hp(26),
      child: Column(
        children: [
          SizedBox(height: size.hp(2)),
          Container(
            height: size.hp(8),
            width: size.wp(60),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 3,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('assets/logo_white.png'),
            ),
          ),
          SizedBox(height: size.hp(4)),
          Container(
            height: size.hp(34),
            width: size.wp(80),
            decoration: BoxDecoration(
              color: const Color(0xffFFFFFF),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.4, 4),
                  blurRadius: 4,
                ),
              ],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.wp(4),
                vertical: size.dp(2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: FontsApp.titulos('Login', size),
                  ),
                  TextFormField(
                    controller: controller.user,
                    decoration: const InputDecoration(
                      labelText: 'Usuario',
                    ),
                    onChanged: (text) {
                      if (text.isNotEmpty) {}
                    },
                  ),
                  TextFormField(
                    controller: controller.pass,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
                    ),
                    onChanged: (text) {},
                  ),
                  SizedBox(height: size.hp(4)),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.login),
                    label: const Text('Ingresar'),
                    onPressed: () async {
                      _submit(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
