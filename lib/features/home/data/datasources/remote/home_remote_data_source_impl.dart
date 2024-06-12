import '../../../../../core/utils/app_endpoints.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/shared_data/models/category_item_info_model.dart';
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
  Future<List<CategoryItemInfoModel>> getPlacesToExplore() async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.topRated,
    );

    if (res.data is! List) return [];

    final categories = List<CategoryItemInfoModel>.from(res.data.map(
      (category) => CategoryItemInfoModel.fromJson(category),
    ));
    return categories;
  }
}
