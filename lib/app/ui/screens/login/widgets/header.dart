import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../utils/responsive.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive size = Responsive(context);
    return Stack(
      children: [
        Positioned(
          top: size.hp(-16),
          right: size.hp(-4),
          child: Transform.rotate(
            angle: -math.pi / -6,
            child: Container(
              height: size.hp(34),
              width: size.wp(90),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    const Color(0xff0D3E80),
                    Theme.of(context).colorScheme.primary.withOpacity(0.8),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
              ),
            ),
          ),
        ),
        Positioned(
          top: size.hp(-12),
          right: size.hp(-14),
          child: Transform.rotate(
            angle: -math.pi / -6,
            child: Container(
              height: size.hp(34),
              width: size.wp(70),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
              ),
            ),
          ),
        ),
        Positioned(
          top: size.hp(-15),
          right: size.hp(26),
          child: Transform.rotate(
            angle: -math.pi / -6,
            child: Container(
              height: size.hp(20),
              width: size.wp(40),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
              ),
            ),
          ),
        ),
        Positioned(
          top: size.hp(8),
          right: size.hp(4),
          child: Opacity(
            opacity: 0.3,
            child: Image.asset(
              'assets/logo_white.png',
              height: 40,
            ),
          ),
        ),
      ],
    );
  }
}
