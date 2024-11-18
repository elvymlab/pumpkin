import 'package:auto_route/auto_route.dart';
import 'package:pumpkin/core/core.dart';
import 'package:pumpkin/modules/main_page/presentation/screens/main_page/main_page_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
@Singleton(order: 1)
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: MainRouteRoute.page, initial: true),
  ];
}
