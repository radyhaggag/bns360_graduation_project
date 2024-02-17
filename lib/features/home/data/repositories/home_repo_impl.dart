import '../../../../core/helpers/execute_and_handle_error.dart';
import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/utils/custom_types.dart';
import '../../domain/entities/banner_entity.dart';
import '../../domain/repositories/home_repo.dart';
import '../datasources/local/home_local_data_source.dart';
import '../datasources/remote/home_remote_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<ResultOrFailure<List<BannerEntity>>> getBanners() async {
    return executeAndHandleErrorAsync<List<BannerEntity>>(
      () => homeRemoteDataSource.getBanners(),
    );
  }

  @override
  Future<ResultOrFailure<List<CategoryItemEntity>>> getPlacesToExplore() {
    return executeAndHandleErrorAsync<List<CategoryItemEntity>>(
      () => homeRemoteDataSource.getPlacesToExplore(),
    );
  }
}
