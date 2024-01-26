import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/helpers/load_json_from_asset.dart';
import '../../../../../core/shared_data/models/category_item_model.dart';
import '../../models/banner_model.dart';
import 'home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final APIConsumer apiConsumer;

  HomeRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<List<BannerModel>> getBanners() async {
    // TODO: implement getBanners
    throw UnimplementedError();
  }

  @override
  Future<List<CategoryItemModel>> getPlacesToExplore() async {
    final res = await loadJsonFromAsset('categories_items.json');
    final places = List<CategoryItemModel>.from(res['data'].map(
      (place) => CategoryItemModel.fromJson(place),
    ));
    return places;
  }
}
