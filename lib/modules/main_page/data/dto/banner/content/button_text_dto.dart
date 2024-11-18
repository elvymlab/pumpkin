import 'package:json_annotation/json_annotation.dart';
import 'package:pumpkin/modules/main_page/data/dto/banner/content/button_font_size_dto.dart';

part 'button_text_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ButtonTextDto {
  const ButtonTextDto({
    required this.text,
    required this.fontSizes,
  });

  final String text;
  final ButtonFontSizeDto fontSizes;

  factory ButtonTextDto.fromJson(Map<String, dynamic> json) =>
      _$ButtonTextDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ButtonTextDtoToJson(this);
}
