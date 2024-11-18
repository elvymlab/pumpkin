import 'package:either_dart/either.dart';
import 'package:pumpkin/core/core.dart';
import 'package:pumpkin/modules/main_page/domain/entities/product.dart';
import 'package:pumpkin/modules/main_page/domain/repositories/main_page_repository.dart';

@injectable
class GetProductsUseCase extends BaseUseCase<List<Product>, NoParams> {
  GetProductsUseCase(this._repository);

  final IMainPageRepository _repository;

  @override
  Future<Either<Failure, List<Product>>> call([NoParams? params]) =>
      _repository.getProducts();
}
