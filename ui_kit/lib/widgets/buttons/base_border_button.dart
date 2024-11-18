import 'package:flutter/material.dart';
import 'package:ui_kit/consts/app_constants.dart';
import 'package:ui_kit/theme/app_theme.dart';

class BaseTextButtonBorder extends StatelessWidget {
  const BaseTextButtonBorder({
    super.key,
    required this.title,
    this.subtitle,
    this.onTap,
    this.borderColor,
    this.textColor,
    this.backgroundColor,
    this.titleTextStyle,
    this.subTextStyle,
  });

  final String title;
  final String? subtitle;

  final VoidCallback? onTap;

  final Color? borderColor;
  final Color? textColor;
  final Color? backgroundColor;

  final TextStyle? titleTextStyle;
  final TextStyle? subTextStyle;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? colors(context).light),
        borderRadius: BorderRadius.circular(AppConstants.baseBorderRadius),
        color: backgroundColor,
      ),
      padding: const EdgeInsets.all(AppConstants.base16),
      child: Row(
        mainAxisAlignment: subtitle != null
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              title,
              style: titleTextStyle ??
                  textStyles(context).body1.copyWith(
                    color: textColor ?? colors(context).light,
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
              maxLines: 2,
            ),
          ),
          if (subtitle != null)
            Flexible(
              child: Text(
                subtitle!,
                style: subTextStyle ??
                    textStyles(context).body1.copyWith(
                      color: textColor ?? colors(context).light,
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
                textAlign: TextAlign.end,
                maxLines: 2,
              ),
            )
        ],
      ),
    ),
  );
}
