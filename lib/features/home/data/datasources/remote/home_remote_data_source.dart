import '../../../../../core/shared_data/models/category_item_model.dart';
import '../../models/banner_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BannerModel>> getBanners();
  Future<List<CategoryItemModel>> getPlacesToExplore();
}
