import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class AlertModal extends StatelessWidget {
  AlertModal({
    Key? key,
    required this.title,
    required this.msn,
    required this.type,
    this.sizeCustom = 10,
  }) : super(key: key);

  final String title, msn, type;
  final double sizeCustom;

  final Map<String, Color> listColor = {
    'info': Colors.blue.shade700,
    'success': Colors.green.shade700,
    'warning': Colors.yellow.shade700,
    'error': Colors.red.shade700,
  };

  final Map<String, IconData> listIcon = {
    'info': Icons.info_outline,
    'success': Icons.check_circle_outline_outlined,
    'warning': Icons.error_outline,
    'error': Icons.highlight_off,
  };

  @override
  Widget build(BuildContext context) {
    Responsive size = Responsive(context);
    return Container(
      clipBehavior: Clip.hardEdge,
      height: (size.height < 600) ? size.hp(12) : size.hp(sizeCustom),
      width: size.wp(92),
      decoration: BoxDecoration(
        color: listColor[type],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned(
            left: -8,
            bottom: -18,
            child: Container(
              height: size.dp(4),
              width: size.dp(4),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Positioned(
            left: 0.6,
            bottom: -8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: size.dp(2),
                width: size.dp(2),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          Positioned(
            right: -20,
            top: -30,
            child: Container(
              height: size.dp(8),
              width: size.dp(8),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Positioned(
            right: -14,
            top: -24,
            child: Container(
              height: size.dp(6),
              width: size.dp(6),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: -8,
            child: Container(
              height: size.dp(3),
              width: size.dp(3),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size.dp(1)),
            child: Row(
              children: [
                Icon(
                  listIcon[type],
                  color: Colors.white,
                  size: size.dp(4.8),
                ),
                SizedBox(width: size.wp(1)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.dp(1.8),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: size.wp(74),
                      child: Text(
                        msn,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
