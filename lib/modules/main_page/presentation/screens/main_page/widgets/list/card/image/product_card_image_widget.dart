import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/consts/app_constants.dart';
import 'package:ui_kit/widgets/image/base_image.dart';

class ProductCardImageWidget extends StatelessWidget {
  const ProductCardImageWidget({
    required this.name,
    required this.height,
    required this.width,
    super.key,
  });

  final String name;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BaseImageWidget(
      size: Size(height.w, width.w),
      name: name,
      borderRadius: const BorderRadius.all(
        Radius.circular(AppConstants.baseBorderRadius10),
      ),
    );
  }
}
