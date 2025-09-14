import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../core/shared_data/entities/review_entity.dart';
import '../../../../core/shared_data/entities/review_summary_entity.dart';
import '../../../../core/utils/custom_types.dart';

abstract class CraftsmanRepo {
  FutureEither<List<ReviewEntity>> getReviews(int itemId);
  FutureEither<CraftsmanEntity> getCraftsman(int itemId);
  FutureEither<ReviewSummaryEntity> getCraftsmanReviewSummary(int itemId);
  FutureEither<void> sendReview(int itemId, double rating, String review);
  FutureEither<void> removeReview(int reviewId, int categoryItemId);
}
