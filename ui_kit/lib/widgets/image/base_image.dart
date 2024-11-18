import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/theme/app_theme.dart';

class BaseImageWidget extends StatelessWidget {
  const BaseImageWidget({
    required this.name,
    this.size,
    this.borderRadius,
    this.isCircle = false,
    this.compressionRatio,
    this.fit = BoxFit.cover,
    super.key,
  });

  final String name;
  final Size? size;
  final BorderRadius? borderRadius;
  final bool isCircle;
  final double? compressionRatio;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) => ExtendedImage.asset(
        name,
        height: size?.height != null ? size!.height : null,
        width: size?.width != null ? size!.width : null,
        compressionRatio: compressionRatio,
        clearMemoryCacheWhenDispose: true,
        loadStateChanged: (state) {
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              final loadingProgress = state.loadingProgress;
              final progress = loadingProgress?.expectedTotalBytes != null
                  ? loadingProgress!.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null;
              return Center(
                child: CircularProgressIndicator(
                  value: progress,
                  color: colors(context).primary,
                ),
              );

            case LoadState.failed:
              return GestureDetector(
                child: Center(
                  child: Icon(
                    Icons.rotate_left_rounded,
                    color: colors(context).greenDark,
                    size: size?.width,
                  ),
                ),
                onTap: () => state.reLoadImage(),
              );

            case LoadState.completed:
              return Container(
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  shape: borderRadius == null && isCircle
                      ? BoxShape.circle
                      : BoxShape.rectangle,
                  image: DecorationImage(
                    image: state.imageProvider,
                    fit: fit,
                  ),
                ),
              );
          }
        },
      );
}
