import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/utils/custom_types.dart';
import '../entities/banner_entity.dart';

abstract class HomeRepo {
  Future<ResultOrFailure<List<BannerEntity>>> getBanners();
  Future<ResultOrFailure<List<CategoryItemEntity>>> getPlacesToExplore();
}
