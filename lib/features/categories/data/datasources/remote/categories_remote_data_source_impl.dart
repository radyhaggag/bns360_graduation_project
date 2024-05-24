import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/shared_data/models/category_item_info_model.dart';
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
  Future<List<CategoryItemInfoModel>> getCategoryItemsById(int id) async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getAllCategoryItems(id),
    );
    final categories = List<CategoryItemInfoModel>.from(res.data.map(
      (category) => CategoryItemInfoModel.fromJson(category),
    ));
    return categories;
  }
}
