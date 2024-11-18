part of 'main_page_cubit.dart';

class MainPageState extends BaseState {
  const MainPageState({
    super.status = BaseStatus.initial,
    this.products = const [],
    this.banners = const [],
  });

  final List<Product> products;

  final List<MainBanner> banners;

  @override
  MainPageState copyWith({
    BaseStatus? status,
    BaseError? baseError,
    List<Product>? products,
    List<MainBanner>? banners,
  }) =>
      MainPageState(
        status: status ?? BaseStatus.initial,
        products: products ?? this.products,
        banners: banners ?? this.banners,
      );
}
