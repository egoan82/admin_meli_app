import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class LoadingFullPage extends StatelessWidget {
  const LoadingFullPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Responsive(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: size.height,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
        ),
        child: Center(
          child: Container(
            height: size.dp(12),
            width: size.dp(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                SizedBox(height: size.hp(2)),
                const Text('Cargando'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
