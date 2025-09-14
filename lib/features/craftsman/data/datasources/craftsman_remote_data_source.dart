import '../../../../core/shared_data/models/craftsman_model.dart';
import '../../../../core/shared_data/models/review_model.dart';
import '../../../../core/shared_data/models/review_summary_model.dart';

abstract class CraftsmanRemoteDataSource {
  Future<List<ReviewModel>> getReviews(int itemId);
  Future<CraftsmanModel> getCraftsman(int itemId);
  Future<ReviewSummaryModel> getCraftsmanReviewSummary(int itemId);
  Future<void> sendReview(int itemId, double rating, String review);
  Future<void> removeReview(int reviewId, int categoryItemId);
}
