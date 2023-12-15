import '../../../../../core/shared_data/models/category_details_model.dart';
import '../../models/banner_model.dart';
import '../../models/category_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BannerModel>> getBanners();
  Future<List<CategoryModel>> getCategories();
  Future<List<CategoryDetailsModel>> getPlacesToExplore();
}
