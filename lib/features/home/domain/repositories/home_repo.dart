import 'package:bns360_graduation_project/core/shared_data/entities/category_item_info_entity.dart';

import '../../../../core/utils/custom_types.dart';
import '../entities/banner_entity.dart';

abstract class HomeRepo {
  FutureEither<List<BannerEntity>> getBanners();
  FutureEither<List<CategoryItemInfoEntity>> getPlacesToExplore();
}
