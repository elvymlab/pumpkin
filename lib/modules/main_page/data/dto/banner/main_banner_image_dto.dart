import 'package:json_annotation/json_annotation.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/main_banner_image.dart';

part 'main_banner_image_dto.g.dart';

@JsonSerializable()
class MainBannerImagesDto extends MainBannerImages {
  const MainBannerImagesDto({
    required super.mobile,
    required super.tablet,
    required super.flex,
  });

  factory MainBannerImagesDto.fromJson(Map<String, dynamic> json) =>
      _$MainBannerImagesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MainBannerImagesDtoToJson(this);
}
