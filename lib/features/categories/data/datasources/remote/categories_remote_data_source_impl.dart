import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/shared_data/models/category_model.dart';

import '../../../../../core/helpers/load_json_from_asset.dart';
import 'categories_remote_data_source.dart';

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final APIConsumer apiConsumer;

  CategoriesRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final res = await loadJsonFromAsset('categories.json');
    final categories = List<CategoryModel>.from(res['data'].map(
      (category) => CategoryModel.fromJson(category),
    ));
    return categories;
  }
}
