import '../../../../core/shared_data/entities/category_entity.dart';
import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/utils/custom_types.dart';

abstract class CategoriesRepo {
  FutureEither<List<CategoryEntity>> getCategories();
  FutureEither<List<CategoryItemEntity>> getCategoryItemsById(int id);
  FutureEither<List<CategoryItemEntity>> searchOnCategoryItemsById(
    int id,
    String text,
  );
}
