import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  AppTextStyles._();

  static TextStyle get title1 => GoogleFonts.inter(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
      );

  static TextStyle get title2 => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
      );

  static TextStyle get title3 => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  static TextStyle get subtitle => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  static TextStyle get body1 => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  static TextStyle get body2 => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
      );
}
