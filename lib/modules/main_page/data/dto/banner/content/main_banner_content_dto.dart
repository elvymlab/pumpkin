import 'package:json_annotation/json_annotation.dart';
import 'package:pumpkin/modules/main_page/data/dto/banner/content/font_data_dto.dart';
import 'package:pumpkin/modules/main_page/data/dto/banner/content/main_banner_button_dto.dart';

part 'main_banner_content_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MainBannerContentDto {
  const MainBannerContentDto({
    this.title,
    this.titleFont,
    this.subtitle,
    this.subtitleFont,
    this.description,
    this.descriptionFont,
    this.button,
  });

  final String? title;
  final FontDataDto? titleFont;
  final String? subtitle;
  final FontDataDto? subtitleFont;
  final String? description;
  final FontDataDto? descriptionFont;
  final MainBannerButtonDto? button;

  factory MainBannerContentDto.fromJson(Map<String, dynamic> json) =>
      _$MainBannerContentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MainBannerContentDtoToJson(this);
}
