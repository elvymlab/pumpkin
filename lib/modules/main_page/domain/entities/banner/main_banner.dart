import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pumpkin/core/utils/extensions/build_context_extension.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/content/main_banner_content.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/main_banner_image.dart';

class MainBanner extends Equatable {
  const MainBanner({
    required this.images,
    this.link,
    this.content,
  });

  final String? link;
  final MainBannerContent? content;
  final MainBannerImages images;

  Size getSize(BuildContext context) {
    if (images.flex == 2) {
      return context.isTablet
          ? Size(
              context.screenSize.width / 3 * 2,
              context.screenSize.height / 3 * 2,
            )
          : Size(context.screenSize.width.w, 340.h);
    }

    return context.isTablet
        ? Size(
            context.screenSize.width / 3,
            context.screenSize.height / 3 * 2,
          )
        : Size(context.screenSize.width.w, 167.h);
  }

  @override
  List<Object?> get props => [
        link,
        content,
        images,
      ];
}
