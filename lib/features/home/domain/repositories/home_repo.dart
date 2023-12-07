import '../../../../core/utils/custom_types.dart';
import '../entities/banner_entity.dart';
import '../entities/category_entity.dart';

abstract class HomeRepo {
  Future<ResultOrFailure<List<BannerEntity>>> getBanners();
  Future<ResultOrFailure<List<CategoryEntity>>> getCategories();
}
