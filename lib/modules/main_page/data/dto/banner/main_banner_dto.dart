import 'package:json_annotation/json_annotation.dart';
import 'package:pumpkin/modules/main_page/data/dto/banner/content/main_banner_content_dto.dart';
import 'package:pumpkin/modules/main_page/data/dto/banner/main_banner_image_dto.dart';

part 'main_banner_dto.g.dart';

@JsonSerializable()
class MainBannerDto {
  const MainBannerDto({
    required this.images,
    this.link,
    this.content,
  });

  final String? link;
  final MainBannerContentDto? content;
  final MainBannerImagesDto images;

  factory MainBannerDto.fromJson(Map<String, dynamic> json) =>
      _$MainBannerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MainBannerDtoToJson(this);
}
