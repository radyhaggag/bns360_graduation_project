import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/helpers/load_json_from_asset.dart';
import '../../../../../core/shared_data/models/category_details_model.dart';
import '../../models/banner_model.dart';
import '../../models/category_model.dart';
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
  Future<List<CategoryModel>> getCategories() async {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<List<CategoryDetailsModel>> getPlacesToExplore() async {
    final res = await loadJsonFromAsset('places_to_explore.json');
    final places = List<CategoryDetailsModel>.from(res['data'].map(
      (place) => CategoryDetailsModel.fromJson(place),
    ));
    return places;
  }
}
