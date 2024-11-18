import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pumpkin/core/utils/extensions/build_context_extension.dart';
import 'package:pumpkin/modules/main_page/domain/entities/product.dart';
import 'package:pumpkin/modules/main_page/presentation/screens/main_page/widgets/list/card/image/product_card_image_widget.dart';
import 'package:pumpkin/modules/main_page/presentation/screens/main_page/widgets/list/card/price/product_card_price_widget.dart';
import 'package:pumpkin/modules/main_page/presentation/screens/main_page/widgets/list/card/title/product_card_title_widget.dart';
import 'package:ui_kit/consts/app_constants.dart';
import 'package:ui_kit/theme/app_theme.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    required this.product,
    super.key,
  });

  final Product product;



  @override
  Widget build(BuildContext context) {
    final itemSize = context.isTablet ? 90.0 : 150.0;
    return Container(
      width: itemSize.w,
      margin: const EdgeInsets.only(bottom: AppConstants.base16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.baseBorderRadius10),
        color: colors(context).light,
        boxShadow: [
          BoxShadow(
            color: colors(context).grey,
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductCardImageWidget(
            name: product.imageUrl,
            height: itemSize,
            width: itemSize,
          ),
          Expanded(
            child: ProductCardTitleWidget(title: product.name),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ProductCardPriceWidget(product: product),
          ),
        ],
      ),
    );
  }
}
