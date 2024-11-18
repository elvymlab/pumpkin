import 'package:flutter/material.dart';

@immutable
class AppColorsExt extends ThemeExtension<AppColorsExt> {
  const AppColorsExt({
    required this.primary,
    required this.green,
    required this.greenLight,
    required this.greenDark,
    required this.greenDarkLight,
    required this.light,
    required this.dark,
    required this.grey,
    required this.background,
    required this.bone,
  });

  final Color primary;
  final Color green;
  final Color greenLight;
  final Color greenDark;
  final Color greenDarkLight;
  final Color light;
  final Color dark;
  final Color grey;
  final Color background;
  final Color bone;

  @override
  ThemeExtension<AppColorsExt> copyWith({
    Color? primary,
    Color? green,
    Color? greenLight,
    Color? greenDark,
    Color? greenDarkLight,
    Color? light,
    Color? dark,
    Color? grey,
    Color? background,
    Color? bone,
  }) =>
      AppColorsExt(
        green: green ?? this.green,
        greenLight: greenLight ?? this.greenLight,
        greenDark: greenDark ?? this.greenDark,
        greenDarkLight: greenDarkLight ?? this.greenDarkLight,
        light: light ?? this.light,
        dark: dark ?? this.dark,
        primary: primary ?? this.primary,
        grey: grey ?? this.grey,
        background: background ?? this.background,
        bone: bone ?? this.bone,
      );

  @override
  ThemeExtension<AppColorsExt> lerp(
      covariant ThemeExtension<AppColorsExt>? other, double t) {
    if (other is! AppColorsExt) return this;
    return AppColorsExt(
      green: Color.lerp(green, other.green, t)!,
      greenLight: Color.lerp(greenLight, other.greenLight, t)!,
      greenDark: Color.lerp(greenDark, other.greenDark, t)!,
      greenDarkLight: Color.lerp(greenDarkLight, other.greenDarkLight, t)!,
      light: Color.lerp(light, other.light, t)!,
      dark: Color.lerp(dark, other.dark, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      background: Color.lerp(background, other.background, t)!,
      bone: Color.lerp(bone, other.bone, t)!,
    );
  }
}
