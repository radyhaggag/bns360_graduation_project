import '../../../../core/helpers/execute_and_handle_error.dart';
import '../../../../core/shared_data/entities/category_details_entity.dart';
import '../../../../core/utils/custom_types.dart';
import '../../domain/entities/banner_entity.dart';
import '../../domain/entities/category_entity.dart';
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
    return executeAndHandleError<List<BannerEntity>>(
      () => homeRemoteDataSource.getBanners(),
    );
  }

  @override
  Future<ResultOrFailure<List<CategoryEntity>>> getCategories() async {
    return executeAndHandleError<List<CategoryEntity>>(
      () => homeRemoteDataSource.getCategories(),
    );
  }

  @override
  Future<ResultOrFailure<List<CategoryDetailsEntity>>> getPlacesToExplore() {
    return executeAndHandleError<List<CategoryDetailsEntity>>(
      () => homeRemoteDataSource.getPlacesToExplore(),
    );
  }
}
