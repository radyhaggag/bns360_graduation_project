import 'package:bns360_graduation_project/core/api/api_consumer.dart';
import 'package:bns360_graduation_project/core/shared_data/models/category_item_model.dart';
import 'package:bns360_graduation_project/core/shared_data/models/category_model.dart';
import 'package:bns360_graduation_project/features/my_business/domain/params/add_business_params.dart';

import '../../../../core/helpers/load_json_from_asset.dart';
import 'my_business_remote_data_source.dart';

class MyBusinessRemoteDataSourceImpl implements MyBusinessRemoteDataSource {
  final APIConsumer apiConsumer;

  MyBusinessRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<void> addBusiness(AddBusinessParams params) {
    // TODO: implement addBusiness
    throw UnimplementedError();
  }

  @override
  Future<List<CategoryModel>> getBusinessCategories() async {
    final res = await loadJsonFromAsset('categories.json');
    final categories = List<CategoryModel>.from(res['data'].map(
      (category) => CategoryModel.fromJson(category),
    ));
    return categories;
  }

  @override
  Future<List<CategoryItemModel>> getMyBusiness() async {
    final res = await loadJsonFromAsset('categories_items.json');
    final items = List<CategoryItemModel>.from(res['data'].map(
      (item) => CategoryItemModel.fromJson(item),
    ));
    return items;
  }
}
