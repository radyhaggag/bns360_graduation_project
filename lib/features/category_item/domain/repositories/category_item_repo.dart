import 'package:bns360_graduation_project/core/shared_data/entities/category_item_entity.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/review_summary_entity.dart';

import '../../../../core/shared_data/entities/review_entity.dart';
import '../../../../core/utils/custom_types.dart';

abstract class CategoryItemRepo {
  FutureEither<List<ReviewEntity>> getReviews(int itemId);
  FutureEither<CategoryItemEntity> getCategoryItem(int itemId);
  FutureEither<ReviewSummaryEntity> getCategoryItemReviewSummary(int itemId);
  FutureEither<void> sendReview(
    int itemId,
    double rating,
    String review,
  );

  FutureEither<void> removeReview(int reviewId, int categoryItemId);
}
