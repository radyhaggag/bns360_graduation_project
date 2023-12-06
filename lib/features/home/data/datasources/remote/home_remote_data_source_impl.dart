import '../../../../../core/api/api_consumer.dart';
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
}
