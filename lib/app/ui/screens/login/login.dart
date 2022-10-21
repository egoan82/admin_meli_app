import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../utils/responsive.dart';
import 'provider/login_controller.dart';
import 'widgets/form.dart';
import 'widgets/header.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive size = Responsive(context);

    return ChangeNotifierProvider<LoginController>(
      create: (context) => LoginController(),
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                color: Color(0xffF6F6F6),
              ),
              child: Stack(
                children: [
                  const Header(),
                  Positioned(
                    bottom: 1,
                    child: SizedBox(
                      width: size.width,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/dashboard.svg',
                          height: size.hp(10),
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) => const FormLogin(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
