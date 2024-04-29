import 'package:bns360_graduation_project/core/shared_data/models/category_item_model.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/helpers/load_json_from_asset.dart';
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
  Future<List<CategoryItemModel>> getCategoryItemsById(String id) async {
    final res = await loadJsonFromAsset('categories_items.json');
    final items = List<CategoryItemModel>.from(res['data'].map(
      (item) => CategoryItemModel.fromJson(item),
    ));
    final filteredItems = items.where((item) => item.id == id).toList();
    return filteredItems;
  }

  @override
  Future<List<CategoryItemModel>> searchOnCategoryItemsById(
    String id,
    String text,
  ) async {
    final res = await loadJsonFromAsset('categories_items.json');
    final items = List<CategoryItemModel>.from(res['data'].map(
      (item) => CategoryItemModel.fromJson(item),
    ));
    final searchLowercase = text.toLowerCase();
    bool isTrue(CategoryItemModel item) {
      final itemNameLowercase = item.nameENG.toLowerCase();
      return (searchLowercase.contains(itemNameLowercase) ||
              itemNameLowercase.contains(searchLowercase)) &&
          item.id == id;
    }

    final filteredItems = items.where((item) => isTrue(item)).toList();
    return filteredItems;
  }
}
