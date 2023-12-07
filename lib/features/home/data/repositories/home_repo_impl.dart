import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/helpers/execute_and_handle_error.dart';
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
  Future<Either<Failure, List<BannerEntity>>> getBanners() async {
    return executeAndHandleError<List<BannerEntity>>(
      () => homeRemoteDataSource.getBanners(),
    );
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    return executeAndHandleError<List<CategoryEntity>>(
      () => homeRemoteDataSource.getCategories(),
    );
  }
}
