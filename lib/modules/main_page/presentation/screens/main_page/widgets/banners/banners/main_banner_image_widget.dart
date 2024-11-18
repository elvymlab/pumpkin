import 'package:flutter/material.dart';
import 'package:pumpkin/core/utils/extensions/build_context_extension.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/main_banner_image.dart';
import 'package:ui_kit/consts/app_constants.dart';
import 'package:ui_kit/theme/app_theme.dart';
import 'package:ui_kit/widgets/image/base_image.dart';

class MainBannerImageWidget extends StatelessWidget {
  const MainBannerImageWidget({
    required this.image,
    required this.size,
    super.key,
  });

  final MainBannerImages image;
  final Size size;

  @override
  Widget build(BuildContext context) => context.isTablet
      ? Padding(
          padding: const EdgeInsets.only(right: AppConstants.base24),
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(AppConstants.baseBorderRadius10),
            child: _buildImage(context),
          ),
        )
      : _buildImage(context);

  Widget _buildImage(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.color,
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          colors(context).light,
          colors(context).light.withOpacity(0),
        ],
        stops: const [0.0, 0.15],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(bounds),
      child: BaseImageWidget(
        name: context.isTablet ? image.tablet : image.mobile,
        size: size,
      ),
    );
  }
}
