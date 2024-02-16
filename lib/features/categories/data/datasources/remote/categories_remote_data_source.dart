import '../../../../../core/shared_data/models/category_item_model.dart';
import '../../../../../core/shared_data/models/category_model.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<CategoryItemModel>> getCategoryItemsById(int id);
  Future<List<CategoryItemModel>> searchOnCategoryItemsById(
    int id,
    String text,
  );
}
