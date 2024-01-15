import '../utils/custom_types.dart';

abstract class UseCase<Type, Params> {
  Future<ResultOrFailure<Type>> call(Params params);
}
