import 'package:dartz/dartz.dart';

import '../errors/error_handler.dart';
import '../errors/failure.dart';

Future<Either<Failure, T>> executeAndHandleError<T>(
  Future<T> Function() function,
) async {
  try {
    final result = await function();
    return Right(result);
  } catch (e) {
    final failure = ErrorHandler.handle(e).failure;
    return Left(failure);
  }
}
