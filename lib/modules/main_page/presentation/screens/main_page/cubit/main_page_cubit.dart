import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pumpkin/core/base/base_bloc.dart';
import 'package:pumpkin/core/core.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/main_banner.dart';
import 'package:pumpkin/modules/main_page/domain/entities/product.dart';
import 'package:pumpkin/modules/main_page/domain/use_cases/get_banners_use_case.dart';
import 'package:pumpkin/modules/main_page/domain/use_cases/get_products_use_case.dart';

part 'main_page_state.dart';

@lazySingleton
class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit(
    this._getProductsUseCase,
    this._getBannersUseCase,
  ) : super(const MainPageState());

  final GetProductsUseCase _getProductsUseCase;
  final GetBannersUseCase _getBannersUseCase;

  /// Получить данные
  Future<void> refresh() async {
    await _fetchBanners();
    await _fetchProducts();
  }

  Future<void> _fetchBanners() async {
    await _getProductsUseCase.call().fold(
          (_) => emit(
            state.copyWith(
              status: BaseStatus.error,
            ),
          ),
          (products) => emit(
            state.copyWith(
              status: BaseStatus.error,
              products: products,
            ),
          ),
        );
  }

  Future<void> _fetchProducts() async {
    await _getBannersUseCase.call().fold(
          (_) => emit(
            state.copyWith(
              status: BaseStatus.error,
            ),
          ),
          (banners) => emit(
            state.copyWith(
              status: BaseStatus.error,
              banners: banners,
            ),
          ),
        );
  }
}
