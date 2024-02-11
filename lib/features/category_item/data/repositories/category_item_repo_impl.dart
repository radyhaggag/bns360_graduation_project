import 'package:bns360_graduation_project/core/helpers/execute_and_handle_error.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/review_entity.dart';

import 'package:bns360_graduation_project/core/utils/custom_types.dart';

import '../../domain/repositories/category_item_repo.dart';
import '../datasources/category_item_remote_data_source.dart';

class CategoryItemRepoImpl implements CategoryItemRepo {
  final CategoryItemRemoteDataSource categoryItemRemoteDataSource;

  CategoryItemRepoImpl({required this.categoryItemRemoteDataSource});

  @override
  FutureEither<List<ReviewEntity>> getReviews(String itemId) {
    return executeAndHandleError(
      () => categoryItemRemoteDataSource.getReviews(itemId),
    );
  }
}
