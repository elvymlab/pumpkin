import 'package:flutter/material.dart';
import 'package:ui_kit/consts/app_constants.dart';
import 'package:ui_kit/widgets/image/base_icon.dart';

class BaseIconButton extends StatelessWidget {
  BaseIconButton({
    required this.icon,
    this.onTap,
    this.color,
  });

  final VoidCallback? onTap;
  final Color? color;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BaseIcon(
        icon: icon,
        size: AppConstants.baseIconSize24,
        color: color,
      ),
    );
  }
}
