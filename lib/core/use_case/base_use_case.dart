import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<ResultOrFailure<Type>> call(Params params);
}
