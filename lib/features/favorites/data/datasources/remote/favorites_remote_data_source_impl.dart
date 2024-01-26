import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/helpers/load_json_from_asset.dart';
import '../../../../../core/shared_data/models/category_item_model.dart';
import '../../../../../core/shared_data/models/craftsman_model.dart';
import 'favorites_remote_data_source.dart';

class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  final APIConsumer apiConsumer;

  FavoritesRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<List<CategoryItemModel>> getFavoriteCategories() async {
    final res = await loadJsonFromAsset('categories_items.json');
    final categories = List<CategoryItemModel>.from(res['data'].map(
      (item) => CategoryItemModel.fromJson(item),
    ));
    return categories;
  }

  @override
  Future<List<CraftsmanModel>> getFavoriteCraftsmen() async {
    final res = await loadJsonFromAsset('craftsmen.json');
    final craftsmen = List<CraftsmanModel>.from(res['data'].map(
      (craftsman) => CraftsmanModel.fromJson(craftsman),
    ));
    return craftsmen;
  }
}
