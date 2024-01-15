import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

typedef ResultOrFailure<T> = Either<Failure, T>;
