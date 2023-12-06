import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/failure.dart';
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
    try {
      final result = await homeRemoteDataSource.getBanners();
      return Right(result);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final result = await homeRemoteDataSource.getCategories();
      return Right(result);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return Left(failure);
    }
  }
}
