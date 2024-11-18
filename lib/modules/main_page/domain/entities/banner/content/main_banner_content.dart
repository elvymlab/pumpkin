import 'package:equatable/equatable.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/content/font_data.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/content/main_banner_button.dart';

class MainBannerContent extends Equatable {
  const MainBannerContent({
    this.title,
    this.titleFont,
    this.subtitle,
    this.subtitleFont,
    this.description,
    this.descriptionFont,
    this.button,
  });

  final String? title;
  final FontData? titleFont;
  final String? subtitle;
  final FontData? subtitleFont;
  final String? description;
  final FontData? descriptionFont;
  final MainBannerButton? button;

  bool get hasButton => button != null && !hasArrowButton;

  bool get hasArrowButton => button != null && button!.isArrow;

  bool get isAlignDown =>
      (button == null || (button?.isArrow ?? true)) && description == null;

  @override
  List<Object?> get props => [
        title,
        titleFont,
        subtitle,
        subtitleFont,
        description,
        descriptionFont,
        button,
      ];
}
