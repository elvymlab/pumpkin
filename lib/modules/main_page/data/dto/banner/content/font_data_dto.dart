import 'package:json_annotation/json_annotation.dart';

part 'font_data_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FontDataDto {
  const FontDataDto({
    this.size,
    this.weight,
    this.color,
    this.family,
    this.tabletSize,
  });

  final int? size;
  final int? tabletSize;
  final int? weight;
  final String? color;
  final String? family;

  factory FontDataDto.fromJson(Map<String, dynamic> json) =>
      _$FontDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FontDataDtoToJson(this);
}
