import 'package:dartz/dartz.dart';

abstract class BaseUseCase<E extends BaseError, P extends Params, T> {
  Future<Either<E, T>> execute({required P params});
}

abstract class Params {
  Either<BaseError, bool> verify();
}

abstract class BaseError {
  final Exception cause;

  BaseError({required this.cause});
}

class NetworkError extends BaseError {
  NetworkError({required Exception cause}) : super(cause: cause);
}

class ValidationError extends BaseError {
  final String message;

  ValidationError({required this.message}) : super(cause: Exception(message));

  @override
  String toString() => message;
}