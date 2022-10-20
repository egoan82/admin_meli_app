import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../utils/colors.dart';
import '../../../utils/responsive.dart';

class AlertRequest extends StatefulWidget {
  const AlertRequest({
    Key? key,
    required this.title,
    required this.subtitle,
    this.ruta,
    this.onPressed,
  }) : super(key: key);
  final String title, subtitle;
  final String? ruta;
  final VoidCallback? onPressed;

  @override
  State<AlertRequest> createState() => _AlertRequestState();
}

class _AlertRequestState extends State<AlertRequest>
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
        height: (size.height < 600)
            ? ((widget.subtitle.length > 32) ? size.hp(34) : size.hp(26))
            : ((widget.subtitle.length > 32) ? size.hp(28) : size.hp(26)),
        width: size.wp(80),
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _animationController,
              child: Icon(
                Icons.question_mark,
                color: ColoresApp.DANGER,
                size: size.dp(10),
              ),
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value.clamp(0.0, 1.5),
                  child: Transform.rotate(
                    angle: (_animation.value * (math.pi * 2)),
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
                color: Color(0xFF707070),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.hp(2)),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Text(
                  widget.subtitle,
                  style: TextStyle(
                    fontSize: (widget.subtitle.length > 32) ? 12 : 18,
                    height: 1.2,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF707070),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  ColoresApp.DANGER,
                ),
                maximumSize: MaterialStateProperty.all<Size>(
                  Size(
                    size.wp(30),
                    size.hp(5),
                  ),
                ),
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(
                    size.wp(30),
                    size.hp(5),
                  ),
                ),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).colorScheme.primary,
                ),
                maximumSize: MaterialStateProperty.all<Size>(
                  Size(
                    size.wp(30),
                    size.hp(5),
                  ),
                ),
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(
                    size.wp(30),
                    size.hp(5),
                  ),
                ),
              ),
              onPressed: (widget.onPressed != null)
                  ? widget.onPressed
                  : () {
                      switch (widget.ruta) {
                        case 'login':
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            'login',
                            (route) => false,
                          );
                          break;
                        case 'home':
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            'home',
                            (route) => false,
                          );
                          break;
                        default:
                          Navigator.pop(context);
                          break;
                      }
                    },
              child: const Text('Aceptar'),
            ),
          ],
        ),
      ],
    );
  }
}
