import '../../../../core/shared_data/models/review_model.dart';

abstract class CraftsmanRemoteDataSource {
  Future<List<ReviewModel>> getReviews(int itemId);
  Future<void> removeReview(int itemId, int reviewId);
}
