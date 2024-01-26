import '../../models/banner_model.dart';

abstract class HomeLocalDataSource {
  List<BannerModel> getBanners();
}
