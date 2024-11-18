import 'package:flutter/cupertino.dart';
import 'package:pumpkin/core/utils/extensions/localozation_extension.dart';
import 'package:pumpkin/modules/main_page/domain/entities/product.dart';
import 'package:ui_kit/consts/app_constants.dart';
import 'package:ui_kit/formatters/price_formatter.dart';
import 'package:ui_kit/theme/app_theme.dart';

class ProductCardPriceWidget extends StatelessWidget {
  const ProductCardPriceWidget({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    if (product.isNotForSale) {
      return Text(
        context.localizations.notForSale,
        style: textStyles(context).title2,
      );
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppConstants.base16,
        0,
        AppConstants.base16,
        AppConstants.base24,
      ),
      child: Text(
        PriceFormatter().format(product.price),
        style: textStyles(context).title2,
      ),
    );
  }
}
