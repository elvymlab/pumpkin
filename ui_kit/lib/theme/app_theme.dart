import 'package:flutter/material.dart';
import 'package:ui_kit/assets/colors.gen.dart';
import 'package:ui_kit/extensions/color_theme_extension.dart';
import 'package:ui_kit/extensions/text_style_theme_extension.dart';
import 'package:ui_kit/text_styles/app_text_styles.dart';

AppColorsExt colors(BuildContext context) =>
    Theme.of(context).extension<AppColorsExt>()!;

TextStyleExt textStyles(BuildContext context) =>
    Theme.of(context).extension<TextStyleExt>()!;

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: UiKitColor.light,
    brightness: Brightness.light,
    scaffoldBackgroundColor: UiKitColor.light,
    appBarTheme: AppBarTheme(
      color: UiKitColor.light,
      elevation: 0,
      surfaceTintColor: UiKitColor.light,
      centerTitle: true,
      titleTextStyle: AppTextStyles.subtitle.copyWith(
        color: UiKitColor.dark,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(UiKitColor.dark),
        textStyle: WidgetStatePropertyAll(AppTextStyles.subtitle),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: UiKitColor.primary,
    ),
    textTheme: TextTheme(
      titleMedium: AppTextStyles.body1.copyWith(
        color: UiKitColor.primary,
        fontWeight: FontWeight.w500,
      ),
    ),
    primaryTextTheme: TextTheme(titleMedium: AppTextStyles.body1),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    extensions: <ThemeExtension>[
      AppColorsExt(
        primary: UiKitColor.primary,
        dark: UiKitColor.dark,
        light: UiKitColor.light,
        green: UiKitColor.green,
        greenDark: UiKitColor.greenDark,
        greenDarkLight: UiKitColor.greenDarkLight,
        greenLight: UiKitColor.greenLight,
        grey: UiKitColor.grey,
        background: UiKitColor.background,
        bone: UiKitColor.bone,
      ),

      /// Custom text styles
      TextStyleExt(
        title1: AppTextStyles.title1,
        title2: AppTextStyles.title2,
        title3: AppTextStyles.title3,
        subtitle: AppTextStyles.subtitle,
        body1: AppTextStyles.body1,
        body2: AppTextStyles.body2,
      ),
    ],
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: UiKitColor.primary,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: UiKitColor.grey,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          AppTextStyles.body1.copyWith(
            color: UiKitColor.light,
          ),
        ),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: UiKitColor.primary,
    ),
    textTheme: TextTheme(
      titleMedium: AppTextStyles.body1.copyWith(
        color: UiKitColor.primary,
        fontWeight: FontWeight.w500,
      ),
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    extensions: <ThemeExtension>[
      /// Custom colors
      AppColorsExt(
        primary: UiKitColor.primary,
        dark: UiKitColor.dark,
        light: UiKitColor.light,
        green: UiKitColor.green,
        greenDark: UiKitColor.greenDark,
        greenDarkLight: UiKitColor.greenDarkLight,
        greenLight: UiKitColor.greenLight,
        grey: UiKitColor.grey,
        background: UiKitColor.background,
        bone: UiKitColor.bone,
      ),

      /// Custom text styles
      TextStyleExt(
        title1: AppTextStyles.title1,
        title2: AppTextStyles.title2,
        title3: AppTextStyles.title3,
        subtitle: AppTextStyles.subtitle,
        body1: AppTextStyles.body1,
        body2: AppTextStyles.body2,
      ),
    ],
  );
}
