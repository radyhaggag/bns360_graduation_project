import '../../models/banner_model.dart';
import '../../models/category_model.dart';

abstract class HomeLocalDataSource {
  List<BannerModel> getBanners();
  List<CategoryModel> getCategories();
}
