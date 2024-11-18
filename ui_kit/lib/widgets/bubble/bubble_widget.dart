import 'package:flutter/cupertino.dart';

class BubbleWidget extends StatelessWidget {
  BubbleWidget({
    required this.color,
    required this.radius,
    this.isHollow = false,
  });

  final double radius;
  final Color color;
  final bool isHollow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isHollow ? null : color,
        border: Border.fromBorderSide(
          BorderSide(width: 4, color: color),
        ),
      ),
    );
  }
}
