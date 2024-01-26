import 'package:bns360_graduation_project/core/api/api_consumer.dart';
import 'package:bns360_graduation_project/core/shared_data/models/category_model.dart';

import '../../../../../core/helpers/load_json_from_asset.dart';
import 'categories_remote_data_source.dart';

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final APIConsumer apiConsumer;

  CategoriesRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final res = await loadJsonFromAsset('categories.json');
    final places = List<CategoryModel>.from(res['data'].map(
      (place) => CategoryModel.fromJson(place),
    ));
    return places;
  }
}
