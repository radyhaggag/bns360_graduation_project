import '../utils/custom_types.dart';

abstract class UseCase<Type, Params> {
  FutureEither<Type> call(Params params);
}
