import 'package:flutter/cupertino.dart';
import 'package:pumpkin/core/utils/extensions/string_extension.dart';
import 'package:ui_kit/consts/app_constants.dart';
import 'package:ui_kit/theme/app_theme.dart';

class ProductCardTitleWidget extends StatelessWidget {
  const ProductCardTitleWidget({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    if (title == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppConstants.base16,
        AppConstants.base24,
        AppConstants.base16,
        AppConstants.base14,
      ),
      child: Text(
        title!.capitalize(),
        style: textStyles(context).subtitle,
        textAlign: TextAlign.start,
      ),
    );
  }
}
