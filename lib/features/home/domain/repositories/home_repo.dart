import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/banner_entity.dart';
import '../entities/category_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BannerEntity>>> getBanners();
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
