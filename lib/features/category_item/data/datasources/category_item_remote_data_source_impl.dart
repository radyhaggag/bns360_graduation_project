import 'package:bns360_graduation_project/config/app_config.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/providers/app_provider.dart';
import '../../../../core/shared_data/models/category_item_model.dart';
import '../../../../core/shared_data/models/review_model.dart';
import '../../../../core/shared_data/models/review_summary_model.dart';
import '../../../../core/utils/app_endpoints.dart';
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
    if (res.data is! List) return [];

    final reviews = List<ReviewModel>.from(res.data.map(
      (review) => ReviewModel.fromJson(review),
    ));

    if (AppConfig().isProd) {
      return reviews;
    }

    List<ReviewModel> customReviews = [];

    for (var i = 0; i < reviews.length; i++) {
      try {
        final res = await apiConsumer.post(
          endpoint: "http://radyhaggag.pythonanywhere.com/predict",
          formData: FormData.fromMap(
            {
              "text": reviews[i].reviewText,
            },
          ),
        );

        final result = res.data["sentiment"];
        final isHappy = result == "Happy";

        customReviews.add(
          ReviewModel.fromEntity(reviews[i].copyWith(
            isHappy: isHappy,
          )),
        );
      } catch (e) {
        customReviews.add(reviews[i]);
      }
    }

    return customReviews;
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
        "Review": review,
        "Rating": rating,
        "businessId": itemId,
        "userId": userId,
      },
    );
  }

  @override
  Future<void> removeReview(
    int reviewId,
    int categoryItemId,
  ) async {
    await apiConsumer.delete(
      endpoint: AppEndpoints.removeBusinessReview(
        businessId: categoryItemId,
        userId: userId,
        reviewAndRatingId: reviewId,
        withoutBusinessId: AppProvider().isAdmin,
      ),
    );
  }
}
