part of '../../core.dart';


/// Класс [Failure] является базовым классом для всех ошибок, которые могут
/// возникнуть в приложении. Содержит описание ошибки (при наличии).
sealed class Failure with EquatableMixin implements Exception {
  /// Создает экземпляр [Failure].
  /// - [error] - описание ошибки.
  const Failure(this.error);

  final String error;

  @override
  List<Object?> get props => [error];
}

// ! ------------------------------- Products ------------------------------- ! //
class ProductsRepoFailure extends Failure {
  const ProductsRepoFailure([
    super.error = 'Products repo failure',
  ]);
}

class ProductsLocalFailure extends Failure {
  const ProductsLocalFailure([
    super.error = 'Products local failure',
  ]);
}
