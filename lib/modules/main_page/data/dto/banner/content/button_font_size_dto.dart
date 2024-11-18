import 'package:json_annotation/json_annotation.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/content/button_font_size.dart';

part 'button_font_size_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ButtonFontSizeDto extends ButtonFontSize {
  const ButtonFontSizeDto({
    required super.tabletSize,
    required super.mobileSize,
  });

  factory ButtonFontSizeDto.fromJson(Map<String, dynamic> json) =>
      _$ButtonFontSizeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ButtonFontSizeDtoToJson(this);
}
