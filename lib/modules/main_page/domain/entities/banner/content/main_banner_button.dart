import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/content/button_text.dart';

class MainBannerButton extends Equatable {
  const MainBannerButton({
    this.title,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.opacity,
    this.isArrow = false,
  });

  final ButtonText? title;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final int? opacity;
  final bool isArrow;

  @override
  List<Object?> get props => [
        title,
        backgroundColor,
        textColor,
        borderColor,
        opacity,
      ];
}
