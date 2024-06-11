import 'package:bns360_graduation_project/core/shared_data/models/category_item_info_model.dart';

import '../../models/banner_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BannerModel>> getBanners();
  Future<List<CategoryItemInfoModel>> getPlacesToExplore();
}
