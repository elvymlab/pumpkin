import 'package:either_dart/either.dart';
import 'package:pumpkin/core/core.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/main_banner.dart';
import 'package:pumpkin/modules/main_page/domain/repositories/main_page_repository.dart';

@injectable
class GetBannersUseCase extends BaseUseCase<List<MainBanner>, NoParams> {
  GetBannersUseCase(this._repository);

  final IMainPageRepository _repository;

  @override
  Future<Either<Failure, List<MainBanner>>> call([NoParams? params]) =>
      _repository.getBanners();
}
