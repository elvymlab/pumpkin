import 'package:either_dart/either.dart';
import 'package:pumpkin/core/core.dart';
import 'package:pumpkin/modules/main_page/data/mappers/banner_mapper.dart';
import 'package:pumpkin/modules/main_page/data/mappers/products_mapper.dart';
import 'package:pumpkin/modules/main_page/data/source/local/main_page_locall_data_souce.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/main_banner.dart';
import 'package:pumpkin/modules/main_page/domain/entities/product.dart';
import 'package:pumpkin/modules/main_page/domain/repositories/main_page_repository.dart';

@LazySingleton(as: IMainPageRepository)
class MainPageRepository extends BaseRepository implements IMainPageRepository {
  MainPageRepository(this._localDataSource);

  final IMainPageLocalDataSource _localDataSource;

  @override
  Failure get failure => const ProductsRepoFailure();

  @override
  Future<Either<Failure, List<Product>>> getProducts() => execute(
        () async => _localDataSource.getProducts().fold(
              (failure) => throw failure,
              (dtos) => dtos.map((dto) => dto.toEntity()).toList(),
            ),
      );

  @override
  Future<Either<Failure, List<MainBanner>>> getBanners() => execute(
        () async => _localDataSource.getBanners().fold(
              (failure) => throw failure,
              (dtos) => dtos.map((dto) => dto.toEntity()).toList(),
            ),
      );
}
