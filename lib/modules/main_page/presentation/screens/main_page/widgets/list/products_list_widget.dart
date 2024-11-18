import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pumpkin/core/utils/extensions/localozation_extension.dart';
import 'package:pumpkin/modules/main_page/presentation/screens/main_page/cubit/main_page_cubit.dart';
import 'package:pumpkin/modules/main_page/presentation/screens/main_page/widgets/list/card/product_card_widget.dart';
import 'package:ui_kit/consts/app_constants.dart';
import 'package:ui_kit/theme/app_theme.dart';
import 'package:ui_kit/widgets/bubble/bubble_widget.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, MainPageState>(
      builder: (context, state) {
        final products = state.products;
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppConstants.base10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.localizations.whatsOnCounter,
                    style: textStyles(context).title1,
                  ),
                  const SizedBox(height: AppConstants.base20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (final product in products)
                            Padding(
                              padding: const EdgeInsets.only(
                                right: AppConstants.base10,
                              ),
                              child: ProductCardWidget(product: product),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 24,
              bottom: 0,
              child: BubbleWidget(
                color: colors(context).green,
                radius: 23,
              ),
            ),
          ],
        );
      },
    );
  }
}
