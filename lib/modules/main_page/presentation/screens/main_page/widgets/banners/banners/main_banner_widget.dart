import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pumpkin/core/utils/extensions/build_context_extension.dart';
import 'package:pumpkin/modules/main_page/presentation/screens/main_page/cubit/main_page_cubit.dart';
import 'package:pumpkin/modules/main_page/presentation/screens/main_page/widgets/banners/banners/main_banner_content_widget.dart';
import 'package:pumpkin/modules/main_page/presentation/screens/main_page/widgets/banners/banners/main_banner_image_widget.dart';
import 'package:ui_kit/consts/app_constants.dart';
import 'package:ui_kit/theme/app_theme.dart';
import 'package:ui_kit/widgets/bubble/bubble_widget.dart';

class MainBannerWidget extends StatelessWidget {
  const MainBannerWidget({super.key});

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          if (context.isTablet)
            Positioned(
              bottom: 25,
              right: context.screenSize.width / 2,
              child: BubbleWidget(
                radius: 18,
                color: colors(context).greenLight,
              ),
            )
          else
            Positioned(
              bottom: 25,
              left: 50,
              child: BubbleWidget(
                radius: 18,
                color: colors(context).greenDark,
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppConstants.base10,
              AppConstants.base10,
              AppConstants.base10,
              AppConstants.base40,
            ),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(AppConstants.baseBorderRadius10),
              child: context.isTablet ? _TabletBanner() : _MobileBanner(),
            ),
          ),
          Positioned(
            left: -28,
            top: (context.screenSize.height / 4).h,
            child: BubbleWidget(
              radius: 38,
              color: colors(context).greenDarkLight,
            ),
          ),
          Positioned(
            top: -50,
            right: -50,
            child: BubbleWidget(
              radius: 50,
              isHollow: true,
              color: colors(context).bone,
            ),
          ),
        ],
      );
}

class _TabletBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, MainPageState>(
      builder: (_, state) {
        final banners = state.banners;
        return SizedBox(
          height: context.screenSize.height / 3 * 2,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final banner in banners)
                  SizedBox(
                    height: banner.getSize(context).height,
                    width: banner.getSize(context).width,
                    child: Stack(
                      children: [
                        MainBannerImageWidget(
                          image: banner.images,
                          size: banner.getSize(context),
                        ),
                        if (banner.content != null)
                          MainSliderBannerContentWidget(
                            content: banner.content!,
                            onTapButton: () {},
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MobileBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, MainPageState>(
      builder: (_, state) {
        final banners = state.banners;
        return Column(
          children: [
            for (final banner in banners)
              SizedBox(
                height: banner.getSize(context).height,
                width: banner.getSize(context).width,
                child: Stack(
                  children: [
                    MainBannerImageWidget(
                      image: banner.images,
                      size: banner.getSize(context),
                    ),
                    if (banner.content != null)
                      MainSliderBannerContentWidget(
                        content: banner.content!,
                        onTapButton: () {},
                      ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
