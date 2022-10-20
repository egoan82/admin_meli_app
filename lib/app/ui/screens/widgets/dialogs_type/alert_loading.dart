import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../utils/responsive.dart';

class AlertLoading extends StatefulWidget {
  const AlertLoading({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<AlertLoading> createState() => _AlertLoadingState();
}

class _AlertLoadingState extends State<AlertLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    return AlertDialog(
      content: SizedBox(
        height: (size.height < 600) ? size.hp(28) : size.hp(24),
        width: size.wp(80),
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _animationController,
              child: Icon(
                Icons.info_outline,
                color: const Color(0xff179DFF),
                size: size.dp(10),
              ),
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value.clamp(0.0, 1.5),
                  child: Transform.rotate(
                    angle: (_animation.value * math.pi),
                    child: child,
                  ),
                );
              },
            ),
            SizedBox(height: size.hp(2)),
            Text(
              widget.title,
              style: const TextStyle(
                  fontSize: 24,
                  height: 1.2,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF707070)),
            ),

            const SizedBox(
              height: 10,
            ),
            CircularProgressIndicator(
              strokeWidth: size.wp(1),
              color: const Color(0xff179DFF),
            ),
            // SizedBox(height: size.hp(2)),
          ],
        ),
      ),
    );
  }
}
