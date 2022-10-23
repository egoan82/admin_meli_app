import 'package:flutter/material.dart';

import '../../../utils/responsive.dart';

class AlertLoading extends StatelessWidget {
  const AlertLoading({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Container(
          height: size.height,
          width: size.width,
          color: Colors.black54,
          child: Center(
            child: Container(
              height: size.hp(12),
              width: size.wp(26),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    strokeWidth: size.wp(1),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  SizedBox(height: size.hp(2)),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1.2,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF707070),
                    ),
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
