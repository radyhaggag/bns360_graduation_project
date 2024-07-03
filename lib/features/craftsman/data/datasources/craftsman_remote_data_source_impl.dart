import 'package:bns360_graduation_project/config/app_config.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/providers/app_provider.dart';
import '../../../../core/shared_data/models/craftsman_model.dart';
import '../../../../core/shared_data/models/review_model.dart';
import '../../../../core/shared_data/models/review_summary_model.dart';
import '../../../../core/utils/app_endpoints.dart';
import 'craftsman_remote_data_source.dart';

class CraftsmanRemoteDataSourceImpl implements CraftsmanRemoteDataSource {
  final APIConsumer apiConsumer;

  CraftsmanRemoteDataSourceImpl(this.apiConsumer);

  String get userId => AppProvider().getProfile()!.id;

  @override
  Future<List<ReviewModel>> getReviews(int itemId) async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.geCraftsmanReviews(itemId),
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
  Future<CraftsmanModel> getCraftsman(int itemId) async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getCraftsmanById(itemId),
    );
    final craftsman = CraftsmanModel.fromJson(res.data);
    return craftsman;
  }

  @override
  Future<ReviewSummaryModel> getCraftsmanReviewSummary(int itemId) async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getCraftsmanReviewSummary(itemId),
    );
    final reviewSummary = ReviewSummaryModel.fromJson(res.data);
    return reviewSummary;
  }

  @override
  Future<void> sendReview(int itemId, double rating, String review) async {
    await apiConsumer.post(
      endpoint: AppEndpoints.sendCraftsmanReview,
      data: {
        "Review": review,
        "Rating": rating,
        "CraftsmanId": itemId,
        "UserId": userId,
      },
    );
  }

  @override
  Future<void> removeReview(int reviewId, int craftsmanId) async {
    await apiConsumer.delete(
      endpoint: AppEndpoints.removeCraftsmanReview(
        craftsmanId: craftsmanId,
        userId: userId,
        reviewAndRatingId: reviewId,
        withoutBusinessId: AppProvider().isAdmin,
      ),
    );
  }
}
