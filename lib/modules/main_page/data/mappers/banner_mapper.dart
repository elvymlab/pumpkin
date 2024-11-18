import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pumpkin/modules/main_page/data/dto/banner/content/button_font_size_dto.dart';
import 'package:pumpkin/modules/main_page/data/dto/banner/content/button_text_dto.dart';
import 'package:pumpkin/modules/main_page/data/dto/banner/content/font_data_dto.dart';
import 'package:pumpkin/modules/main_page/data/dto/banner/content/main_banner_button_dto.dart';
import 'package:pumpkin/modules/main_page/data/dto/banner/content/main_banner_content_dto.dart';
import 'package:pumpkin/modules/main_page/data/dto/banner/main_banner_dto.dart';
import 'package:pumpkin/modules/main_page/data/dto/banner/main_banner_image_dto.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/content/button_font_size.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/content/button_text.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/content/font_data.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/content/main_banner_button.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/content/main_banner_content.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/main_banner.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/main_banner_image.dart';

extension ButtonFontSizeDtoMapper on ButtonFontSizeDto {
  ButtonFontSize toEntity() {
    return ButtonFontSize(
      tabletSize: tabletSize,
      mobileSize: mobileSize,
    );
  }
}

extension ButtonTextDtoMapper on ButtonTextDto {
  ButtonText toEntity() {
    return ButtonText(
      text: text,
      fontSizes: fontSizes.toEntity(),
    );
  }
}

extension FontDataDtoMapper on FontDataDto {
  FontData toEntity() {
    return FontData(
      size: size,
      color: color != null && color!.isNotEmpty ? HexColor(color!) : null,
      weight: weight,
      family: family,
      tabletSize: tabletSize,
    );
  }
}

extension MainBannerButtonDtoMapper on MainBannerButtonDto {
  Color? _parseColor(String? color) => color != null ? HexColor(color) : null;

  MainBannerButton toEntity() {
    return MainBannerButton(
      title: title?.toEntity(),
      backgroundColor: _parseColor(backgroundColor),
      borderColor: _parseColor(borderColor),
      textColor: _parseColor(textColor),
      opacity: opacity,
      isArrow: isArrow ?? false,
    );
  }
}

extension MainBannerContentDtoMapper on MainBannerContentDto {
  MainBannerContent toEntity() {
    return MainBannerContent(
      title: title,
      titleFont: titleFont?.toEntity(),
      subtitle: subtitle,
      subtitleFont: subtitleFont?.toEntity(),
      description: description,
      descriptionFont: descriptionFont?.toEntity(),
      button: button?.toEntity(),
    );
  }
}

extension MainBannerDtoMapper on MainBannerDto {
  MainBanner toEntity() {
    return MainBanner(
      link: link,
      content: content?.toEntity(),
      images: images.toEntity(),
    );
  }
}

extension MainBannerImagesDtoMapper on MainBannerImagesDto {
  MainBannerImages toEntity() {
    return MainBannerImages(
      mobile: mobile,
      tablet: tablet,
      flex: flex,
    );
  }
}
