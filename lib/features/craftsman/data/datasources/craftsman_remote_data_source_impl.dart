import '../../../../core/api/api_consumer.dart';
import '../../../../core/helpers/load_json_from_asset.dart';
import '../../../../core/shared_data/models/review_model.dart';
import 'craftsman_remote_data_source.dart';

class CraftsmanRemoteDataSourceImpl implements CraftsmanRemoteDataSource {
  final APIConsumer apiConsumer;

  CraftsmanRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<List<ReviewModel>> getReviews(int itemId) async {
    final res = await loadJsonFromAsset('reviews.json');
    final reviews = List<ReviewModel>.from(res['data'].map(
      (review) => ReviewModel.fromJson(review),
    ));
    return reviews;
  }

  @override
  Future<void> removeReview(int itemId, int reviewId) async {
    // await apiConsumer.delete(
    //   endpoint: AppEndpoints.removeReview(reviewId),
    // );
  }
}
