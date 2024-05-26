import '../../../../core/shared_data/entities/review_entity.dart';
import '../../../../core/utils/custom_types.dart';

abstract class CraftsmanRepo {
  FutureEither<List<ReviewEntity>> getReviews(int itemId);
  FutureEither<void> removeReview(int itemId, int reviewId);
}
