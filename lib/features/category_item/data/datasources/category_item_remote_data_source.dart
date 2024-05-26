import 'package:bns360_graduation_project/core/shared_data/entities/category_item_entity.dart';

import '../../../../core/shared_data/models/review_model.dart';
import '../../../../core/shared_data/models/review_summary_model.dart';

abstract class CategoryItemRemoteDataSource {
  Future<List<ReviewModel>> getReviews(int itemId);
  Future<CategoryItemEntity> getCategoryItem(int itemId);
  Future<ReviewSummaryModel> getCategoryItemReviewSummary(int itemId);
  Future<void> sendReview(int itemId, double rating, String review);
  Future<void> removeReview(int reviewId, int categoryItemId);
}
