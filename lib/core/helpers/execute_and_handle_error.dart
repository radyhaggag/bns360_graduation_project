import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../errors/error_handler.dart';
import '../utils/custom_types.dart';
import '../utils/main_logger.dart';

FutureEither<T> executeAndHandleErrorAsync<T>(
  Future<T> Function() function, {
  Future<T> Function(dynamic e)? onFailure,
}) async {
  try {
    final result = await function();
    return Right(result);
  } catch (e) {
    if (kDebugMode) {
      rethrow;
    }
    if (onFailure != null) {
      final result = await onFailure.call(e);
      return Right(result);
    }
    final failure = ErrorHandler.handle(e).failure;
    logger.e(e);
    return Left(failure);
  }
}

ResultOrFailure<T> executeAndHandleError<T>(
  T Function() function,
) {
  try {
    final result = function();
    return Right(result);
  } catch (e) {
    // if (kDebugMode) {
    //   rethrow;
    // }
    final failure = ErrorHandler.handle(e).failure;
    logger.e(e);
    return Left(failure);
  }
}
