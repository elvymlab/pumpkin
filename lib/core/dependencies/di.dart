import 'package:get_it/get_it.dart';
import 'package:pumpkin/core/core.dart';
import 'package:pumpkin/core/dependencies/di.config.dart';

/// Глобальный экземпляр [GetIt] для доступа к зависимостям.
GetIt get getIt => GetIt.instance;

/// Инициализация зависимостей.
/// Вызывается в методе `main` перед запуском приложения.
@InjectableInit()
Future<void> setupDependencies() async {
  // Инициализация GetIt и зависимостей
  getIt.init();
}
