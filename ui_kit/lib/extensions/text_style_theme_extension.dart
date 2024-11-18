import 'package:flutter/material.dart';

@immutable
class TextStyleExt extends ThemeExtension<TextStyleExt> {
  const TextStyleExt({
    required this.title1,
    required this.title2,
    required this.title3,
    required this.subtitle,
    required this.body1,
    required this.body2,
  });

  /// w700, 30
  final TextStyle title1;

  /// w700, 20
  final TextStyle title2;

  /// w400, 20
  final TextStyle title3;

  /// w400, 16
  final TextStyle subtitle;

  /// w400, 14
  final TextStyle body1;

  /// w700, 16
  final TextStyle body2;

  @override
  ThemeExtension<TextStyleExt> copyWith({
    TextStyle? title1,
    TextStyle? title2,
    TextStyle? title3,
    TextStyle? subtitle,
    TextStyle? body1,
    TextStyle? body2,
  }) =>
      TextStyleExt(
        title1: title1 ?? this.title1,
        title2: title2 ?? this.title2,
        title3: title3 ?? this.title3,
        subtitle: subtitle ?? this.subtitle,
        body1: body1 ?? this.body1,
        body2: body2 ?? this.body2,
      );

  @override
  ThemeExtension<TextStyleExt> lerp(
      covariant ThemeExtension<TextStyleExt>? other, double t) {
    if (other is! TextStyleExt) return this;
    return TextStyleExt(
      title1: TextStyle.lerp(title1, other.title1, t)!,
      title2: TextStyle.lerp(title2, other.title2, t)!,
      title3: TextStyle.lerp(title3, other.title3, t)!,
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t)!,
      body1: TextStyle.lerp(body1, other.body1, t)!,
      body2: TextStyle.lerp(body2, other.body2, t)!,
    );
  }
}
