import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BaseIcon extends StatelessWidget {
  const BaseIcon({
    required this.icon,
    this.color,
    this.size = 18,
    this.height,
    this.width,
    super.key,
  });

  final String icon;
  final Color? color;
  final double? height;
  final double? width;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      fit: BoxFit.cover,
      width: width ?? size,
      height: height ?? size,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}
