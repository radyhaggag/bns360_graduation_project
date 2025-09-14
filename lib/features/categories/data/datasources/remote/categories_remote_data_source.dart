import '../../../../../core/shared_data/models/category_item_info_model.dart';

import '../../../../../core/shared_data/models/category_model.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<CategoryItemInfoModel>> getCategoryItemsById(int id);
}
