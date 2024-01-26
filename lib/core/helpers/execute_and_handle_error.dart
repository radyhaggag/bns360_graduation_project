import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../errors/error_handler.dart';
import '../utils/custom_types.dart';

Future<ResultOrFailure<T>> executeAndHandleError<T>(
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
