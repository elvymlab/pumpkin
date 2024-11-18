import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pumpkin/core/dependencies/di.dart';
import 'package:pumpkin/core/utils/extensions/localozation_extension.dart';
import 'package:pumpkin/modules/navigation/router/app_router.dart';
import 'package:ui_kit/theme/app_theme.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  AppRouter get _router => getIt<AppRouter>();

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'Pumpkin',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        routeInformationParser: _router.defaultRouteParser(),
        routerDelegate: _router.delegate(),
        locale: const Locale('ru'),
        builder: (_, child) => MediaQuery.withNoTextScaling(
          child: ScreenUtilInit(
            minTextAdapt: true,
            splitScreenMode: true,
            child: child,
          ),
        ),
      );
}
