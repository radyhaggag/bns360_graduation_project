import 'package:bns360_graduation_project/core/shared_data/models/category_item_model.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/shared_data/models/category_model.dart';
import '../../../../../core/utils/app_endpoints.dart';
import 'categories_remote_data_source.dart';

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final APIConsumer apiConsumer;

  CategoriesRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getAllCategories,
    );
    final categories = List<CategoryModel>.from(res.data.map(
      (category) => CategoryModel.fromJson(category),
    ));
    return categories;
  }

  @override
  Future<List<CategoryItemModel>> getCategoryItemsById(int id) async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getAllCategoryItems,
    );
    final categories = List<CategoryItemModel>.from(res.data.map(
      (category) => CategoryItemModel.fromJson(category),
    ));
    return categories;
  }
}
