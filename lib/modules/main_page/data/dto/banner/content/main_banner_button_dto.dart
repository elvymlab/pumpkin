import 'package:json_annotation/json_annotation.dart';
import 'package:pumpkin/modules/main_page/data/dto/banner/content/button_text_dto.dart';

part 'main_banner_button_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MainBannerButtonDto {
  const MainBannerButtonDto({
    this.title,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.opacity,
    this.isArrow,
  });

  final ButtonTextDto? title;
  final String? backgroundColor;
  final String? textColor;
  final String? borderColor;
  final int? opacity;
  final bool? isArrow;

  factory MainBannerButtonDto.fromJson(Map<String, dynamic> json) =>
      _$MainBannerButtonDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MainBannerButtonDtoToJson(this);
}
