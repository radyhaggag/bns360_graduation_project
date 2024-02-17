import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../errors/error_handler.dart';
import '../utils/custom_types.dart';

Future<ResultOrFailure<T>> executeAndHandleErrorAsync<T>(
  Future<T> Function() function,
) async {
  try {
    final result = await function();
    return Right(result);
  } catch (e) {
    final failure = ErrorHandler.handle(e).failure;
    log(e.toString());
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
    final failure = ErrorHandler.handle(e).failure;
    log(e.toString());
    return Left(failure);
  }
}
