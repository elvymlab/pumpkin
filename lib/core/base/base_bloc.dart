import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<E, S extends BaseState> extends Bloc<E, S> {
  BaseBloc(super.initialState);

  void handleError(
    Object error,
    StackTrace stackTrace,
    Emitter<BaseState> emit, {
    List<String> info = const [],
  }) {
    emit(
      state.copyWith(
        status: BaseStatus.error,
        baseError: _getError(error),
      ),
    );
  }
}

abstract class BaseCubit<S extends BaseState> extends Cubit<S> {
  BaseCubit(super.initialState);

  void handleError(
    Object error,
    StackTrace stackTrace,
    Function emit, {
    List<String> info = const [],
  }) {
    emit(
      state.copyWith(
        status: BaseStatus.error,
        baseError: _getError(error),
      ),
    );
  }
}

BaseError _getError(dynamic error) {
  if (error is Exception) {
    return BaseError(ErrorType.unprocessableEntity, message: error.toString());
  } else {
    return BaseError(ErrorType.unknown);
  }
}

enum BaseStatus { initial, loading, error, success }

extension BaseStatusExtension on BaseStatus {
  bool get isSuccess => this == BaseStatus.success;

  bool get isLoading => this == BaseStatus.loading;

  bool get isInitial => this == BaseStatus.initial;

  bool get isError => this == BaseStatus.error;
}

abstract class BaseState {
  const BaseState({
    required this.status,
    this.baseError,
  });

  final BaseStatus status;
  final BaseError? baseError;

  bool get error => status.isError;

  bool get loading => status.isLoading;

  bool get success => status.isSuccess;

  bool get initial => status.isInitial;

  BaseState copyWith({required BaseStatus status, BaseError? baseError});
}

class BaseError {
  BaseError(
    this.errorType, {
    this.message,
  });

  final ErrorType errorType;
  final String? message;
}

enum ErrorType {
  unprocessableEntity,
  unknown,
}

extension BaseErrorExtension on BaseError? {
  bool get isUnprocessableEntity =>
      this?.errorType == ErrorType.unprocessableEntity;

  bool get isUnknown => this?.errorType == ErrorType.unknown;
}
