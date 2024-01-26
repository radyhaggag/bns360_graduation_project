import '../../../../core/shared_data/entities/category_entity.dart';
import '../../../../core/utils/custom_types.dart';

abstract class CategoriesRepo {
  FutureEither<List<CategoryEntity>> getCategories();
}
