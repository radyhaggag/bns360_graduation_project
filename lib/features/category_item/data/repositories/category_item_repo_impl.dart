import 'package:bns360_graduation_project/core/shared_data/entities/category_item_entity.dart';

import '../../../../core/helpers/execute_and_handle_error.dart';
import '../../../../core/shared_data/entities/review_entity.dart';
import '../../../../core/shared_data/entities/review_summary_entity.dart';
import '../../../../core/utils/custom_types.dart';
import '../../domain/repositories/category_item_repo.dart';
import '../datasources/category_item_remote_data_source.dart';

class CategoryItemRepoImpl implements CategoryItemRepo {
  final CategoryItemRemoteDataSource categoryItemRemoteDataSource;

  CategoryItemRepoImpl({required this.categoryItemRemoteDataSource});

  @override
  FutureEither<List<ReviewEntity>> getReviews(int itemId) {
    return executeAndHandleErrorAsync(
      () => categoryItemRemoteDataSource.getReviews(itemId),
    );
  }

  @override
  FutureEither<CategoryItemEntity> getCategoryItem(int itemId) {
    return executeAndHandleErrorAsync(
      () => categoryItemRemoteDataSource.getCategoryItem(itemId),
    );
  }

  @override
  FutureEither<ReviewSummaryEntity> getCategoryItemReviewSummary(int itemId) {
    return executeAndHandleErrorAsync(
      () => categoryItemRemoteDataSource.getCategoryItemReviewSummary(itemId),
    );
  }

  @override
  FutureEither<void> sendReview(int itemId, double rating, String review) {
    return executeAndHandleErrorAsync(
      () => categoryItemRemoteDataSource.sendReview(itemId, rating, review),
    );
  }

  @override
  FutureEither<void> removeReview(int reviewId, int categoryItemId) {
    return executeAndHandleErrorAsync(
      () => categoryItemRemoteDataSource.removeReview(
        reviewId,
        categoryItemId,
      ),
    );
  }
}
