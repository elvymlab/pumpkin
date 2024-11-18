import 'package:pumpkin/modules/main_page/data/dto/product_dto.dart';
import 'package:pumpkin/modules/main_page/domain/entities/product.dart';

extension ProductDtoMapper on ProductDto {
  Product toEntity() {
    return Product(
      name: name,
      price: price,
      imageUrl: imageUrl,
    );
  }
}
