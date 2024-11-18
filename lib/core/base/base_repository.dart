part of '../core.dart';

/// Базовый класс для всех репозиториев. Предоставляет методы для выполнения
/// асинхронных действий и логирования ошибок.

abstract class BaseRepository {
  BaseRepository();

  /// Возвращает объект ошибки, который будет возвращен в случае ошибки.
  Failure get failure;

  /// Выполняет асинхронное действие и возвращает результат в виде [Either].
  ///
  /// - [action] - асинхронное действие.
  /// - [failure] - ошибка, которая будет возвращена в случае ошибки.
  ///
  /// Возвращает:
  /// - [Right<T>] если действие выполнено успешно.
  /// - [Left<Failure>] если произошла ошибка.
  Future<Either<Failure, T>> execute<T>(Future<T> Function() action) async {
    try {
      final result = await action();
      return Right(result);
    } on Exception catch (e, st) {
      return Left(_logError(failure, e, st));
    }
  }

  /// Логирует ошибку и возвращает ее.
  Failure _logError(
    Failure f,
    Object e, [
    StackTrace? st,
  ]) {
    _buildMessage(f);
    return f;
  }

  /// Строит сообщение об ошибке.
  /// Возвращает строку с именем класса и сообщением об ошибке.
  /// Если сообщение об ошибке отсутствует, возвращает только имя класса.
  /// Пример: 'BaseRepository :: Failure :: error message'
  String _buildMessage(Failure f) {
    final where = runtimeType.toString();
    final who = f.runtimeType.toString();
    final errorMessage = f.error;
    return '$where :: $who :: $errorMessage';
  }
}
