import 'package:bns360_graduation_project/core/providers/app_provider.dart';
import 'package:bns360_graduation_project/core/shared_data/models/category_item_model.dart';
import 'package:bns360_graduation_project/core/shared_data/models/review_summary_model.dart';
import 'package:bns360_graduation_project/core/utils/app_endpoints.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/shared_data/models/review_model.dart';
import 'category_item_remote_data_source.dart';

class CategoryItemRemoteDataSourceImpl implements CategoryItemRemoteDataSource {
  final APIConsumer apiConsumer;

  CategoryItemRemoteDataSourceImpl(this.apiConsumer);

  String get userId => AppProvider().getProfile()!.id;

  @override
  Future<List<ReviewModel>> getReviews(int itemId) async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getBusinessReviews(itemId),
    );
    final reviews = List<ReviewModel>.from(res.data.map(
      (review) => ReviewModel.fromJson(review),
    ));
    return reviews;
  }

  @override
  Future<CategoryItemModel> getCategoryItem(int itemId) async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getCategoryItem(itemId),
    );
    final categoryItem = CategoryItemModel.fromJson(res.data);
    return categoryItem;
  }

  @override
  Future<ReviewSummaryModel> getCategoryItemReviewSummary(int itemId) async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getBusinessReviewSummary(itemId),
    );
    final reviewSummary = ReviewSummaryModel.fromJson(res.data);
    return reviewSummary;
  }

  @override
  Future<void> sendReview(int itemId, double rating, String review) async {
    await apiConsumer.post(
      endpoint: AppEndpoints.sendBusinessReview,
      data: {
        "review": review,
        "rating": rating,
        "businessId": itemId,
        "userId": userId,
      },
    );
  }

  @override
  Future<void> removeReview(int reviewId, int categoryItemId) async {
    await apiConsumer.delete(
      endpoint: AppEndpoints.removeBusinessReview(
        businessId: categoryItemId,
        userId: userId,
        reviewAndRatingId: reviewId,
      ),
    );
  }
}
