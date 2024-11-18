import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pumpkin/core/dependencies/di.dart';
import 'package:pumpkin/modules/main_page/presentation/screens/main_page/cubit/main_page_cubit.dart';
import 'package:pumpkin/modules/main_page/presentation/screens/main_page/widgets/banners/banners/main_banner_widget.dart';
import 'package:pumpkin/modules/main_page/presentation/screens/main_page/widgets/list/products_list_widget.dart';
import 'package:ui_kit/theme/app_theme.dart';

@RoutePage()
class MainPageScreen extends StatelessWidget implements AutoRouteWrapper {
  const MainPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colors(context).background,
        body: const SingleChildScrollView(
          child: Column(
            children: [
              MainBannerWidget(),
              ProductsListWidget(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<MainPageCubit>()..refresh(),
      child: this,
    );
  }
}
