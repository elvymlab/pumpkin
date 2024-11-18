import 'package:json_annotation/json_annotation.dart';
import 'package:pumpkin/modules/main_page/domain/entities/product.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto extends Product {
  const ProductDto({
    required super.name,
    required super.price,
    required super.imageUrl,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}
