import 'package:bns360_graduation_project/core/providers/app_provider.dart';
import 'package:bns360_graduation_project/core/shared_data/models/review_summary_model.dart';
import 'package:bns360_graduation_project/core/utils/app_endpoints.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/shared_data/models/craftsman_model.dart';
import '../../../../core/shared_data/models/review_model.dart';
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
    final reviews = List<ReviewModel>.from(res.data.map(
      (review) => ReviewModel.fromJson(review),
    ));
    return reviews;
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
        "review": review,
        "rating": rating,
        "craftsmanId": itemId,
        "userId": userId,
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
      ),
    );
  }
}
