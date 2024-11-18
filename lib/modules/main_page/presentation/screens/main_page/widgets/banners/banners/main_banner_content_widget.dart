import 'package:flutter/material.dart';
import 'package:pumpkin/core/utils/extensions/build_context_extension.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/content/button_text.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/content/main_banner_button.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/content/main_banner_content.dart';
import 'package:ui_kit/assets/assets.gen.dart';
import 'package:ui_kit/consts/app_constants.dart';
import 'package:ui_kit/theme/app_theme.dart';
import 'package:ui_kit/widgets/buttons/base_icon_button.dart';

class MainSliderBannerContentWidget extends StatelessWidget {
  const MainSliderBannerContentWidget({
    required this.content,
    required this.onTapButton,
    super.key,
  });

  final MainBannerContent content;

  final VoidCallback onTapButton;

  String get _title => content.title ?? '';

  String get _subtitle => content.subtitle ?? '';

  String get _description => content.description ?? '';

  Color? get _titleColor => content.titleFont?.color;

  Color? get _subtitleColor => content.subtitleFont?.color;

  Color? get _descriptionColor => content.descriptionFont?.color;

  MainBannerButton? get _button => content.button;

  TextStyle _titleTextStyle(BuildContext context) => TextStyle(
        fontFamily: content.titleFont?.family,
        fontSize: context.isTablet
            ? content.titleFont?.tabletSize?.toDouble()
            : content.titleFont?.size?.toDouble(),
        fontWeight: content.titleFont?.getFontWeight(),
        color: _titleColor,
      );

  TextStyle _subtitleTextStyle(BuildContext context) => TextStyle(
        fontFamily: content.subtitleFont?.family,
        fontSize: context.isTablet
            ? content.subtitleFont?.tabletSize?.toDouble()
            : content.subtitleFont?.size?.toDouble(),
        fontWeight: content.subtitleFont?.getFontWeight(),
        color: _subtitleColor,
      );

  TextStyle _descriptionTextStyle(BuildContext context) => TextStyle(
        fontFamily: content.descriptionFont?.family,
        fontSize: context.isTablet
            ? content.descriptionFont?.tabletSize?.toDouble()
            : content.descriptionFont?.size?.toDouble(),
        fontWeight: content.descriptionFont?.getFontWeight(),
        color: _descriptionColor,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        context.isTablet ? AppConstants.base32 : AppConstants.base20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ContextTextWidget(
                text: _title,
                textStyle: _titleTextStyle(context),
              ),
              if (!context.isTablet || !content.isAlignDown) ...[
                _ContextTextWidget(
                  text: _subtitle,
                  textStyle: _subtitleTextStyle(context),
                ),
                if (content.hasArrowButton)
                  _BannerButton(
                    onTapButton: onTapButton,
                    button: _button!,
                  ),
              ],
              if (context.isTablet)
                _ContextTextWidget(
                  text: _description,
                  textStyle: _descriptionTextStyle(context),
                ),
            ],
          ),
          const Spacer(),
          if (context.isTablet && content.isAlignDown)
            _buildAlignDownSubtitle(context),
          if (content.hasButton)
            _BannerButton(
              onTapButton: onTapButton,
              button: _button!,
            ),
        ],
      ),
    );
  }

  Widget _buildAlignDownSubtitle(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          flex: 4,
          child: _ContextTextWidget(
            text: _subtitle,
            textStyle: _subtitleTextStyle(context),
          ),
        ),
        if (content.hasArrowButton) ...[
          const SizedBox(width: AppConstants.base8),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppConstants.base20),
              child: _BannerButton(
                onTapButton: onTapButton,
                button: _button!,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _ContextTextWidget extends StatelessWidget {
  const _ContextTextWidget({
    required this.text,
    required this.textStyle,
  });

  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppConstants.base6),
      child: Text(text, style: textStyle),
    );
  }
}

class _BannerButton extends StatelessWidget {
  const _BannerButton({
    required this.onTapButton,
    required this.button,
  });

  final VoidCallback onTapButton;
  final MainBannerButton button;

  ButtonText? get _titleData => button.title;

  Color? get _textColor => button.textColor;

  Color? get _backgroundColor => button.backgroundColor;

  Color? get _borderColor => button.borderColor;

  @override
  Widget build(BuildContext context) {
    if (button.isArrow) {
      return BaseIconButton(icon: Assets.images.arrow);
    }

    return GestureDetector(
      onTap: onTapButton,
      child: Container(
        decoration: BoxDecoration(
          color: _backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(
            AppConstants.baseBorderRadius10,
          ),
          border: Border.all(
            color: _borderColor ?? colors(context).light,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: AppConstants.base20,
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            Expanded(
              child: _ButtonTextWidget(
                textData: _titleData,
                color: _textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonTextWidget extends StatelessWidget {
  const _ButtonTextWidget({
    this.textData,
    this.color,
  });

  final ButtonText? textData;
  final Color? color;

  String get _text => textData?.text ?? '';

  int? get _mobileTitleSize => textData?.fontSizes.mobileSize;

  int? get _tabletTitleSize => textData?.fontSizes.tabletSize;

  @override
  Widget build(BuildContext context) {
    if (_text.isEmpty) return const SizedBox.shrink();

    return Text(
      _text,
      textAlign: TextAlign.center,
      style: textStyles(context).subtitle.copyWith(
            color: color,
            fontSize: (context.isTablet ? _tabletTitleSize : _mobileTitleSize)
                ?.toDouble(),
            height: 1,
          ),
    );
  }
}
