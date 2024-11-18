import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/services.dart';
import 'package:pumpkin/core/core.dart';
import 'package:pumpkin/modules/main_page/data/dto/banner/main_banner_dto.dart';
import 'package:pumpkin/modules/main_page/data/dto/product_dto.dart';

/// [IMainPageLocalDataSource] это абстракция для работы с локальными данными
abstract interface class IMainPageLocalDataSource {
  Future<Either<Failure, List<ProductDto>>> getProducts();

  Future<Either<Failure, List<MainBannerDto>>> getBanners();
}

@LazySingleton(as: IMainPageLocalDataSource)
class MainPageLocalDataSource implements IMainPageLocalDataSource {
  @override
  Future<Either<Failure, List<ProductDto>>> getProducts() async {
    try {
      final data = await rootBundle.loadString('assets/json/vegetables.json');
      final productsJson = json.decode(data) as List<dynamic>;
      final products = productsJson
          .map((json) => ProductDto.fromJson(json as Map<String, dynamic>))
          .toList();
      return Right(products);
    } catch (e) {
      return Left(ProductsLocalFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MainBannerDto>>> getBanners() async {
    try {
      final data = await rootBundle.loadString('assets/json/banners.json');
      final bannersJson = json.decode(data) as List<dynamic>;
      final banners = bannersJson
          .map((json) => MainBannerDto.fromJson(json as Map<String, dynamic>))
          .toList();
      return Right(banners);
    } catch (e) {
      return Left(ProductsLocalFailure(e.toString()));
    }
  }
}
