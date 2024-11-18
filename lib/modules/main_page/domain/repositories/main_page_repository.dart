import 'package:either_dart/either.dart';
import 'package:pumpkin/core/core.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/main_banner.dart';
import 'package:pumpkin/modules/main_page/domain/entities/product.dart';

abstract interface class IMainPageRepository {
  /// Получение списка продуктов
  Future<Either<Failure, List<Product>>> getProducts();

  /// Получение списка баннеров на главной
  Future<Either<Failure, List<MainBanner>>> getBanners();
}
