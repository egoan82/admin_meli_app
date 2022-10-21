// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/fonts.dart';
import '../../utils/responsive.dart';
import 'controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController controller = SplashController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => validarSession(),
    );
  }

  void validarSession() async {
    final bool result = await controller.onInit();

    if (result) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        'home',
        (route) => false,
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        'login',
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ZoomIn(
                  child: FadeInDown(
                    from: 200,
                    child: Column(
                      children: [
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
                        SizedBox(height: size.hp(2)),
                        FontsApp.titulos('Admin-meli', size)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.hp(1.5)),
                FadeInUp(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.secondary,
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.2),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: size.dp(2),
            child: FadeInUp(
              child: SizedBox(
                width: size.wp(100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'Desarrollado por ',
                      style: TextStyle(
                        color: const Color(0xff3d5169),
                        fontSize: size.dp(1.5),
                      ),
                    ),
                    SizedBox(width: size.wp(1)),
                    Image.asset('assets/logo2.png', width: size.wp(25)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
