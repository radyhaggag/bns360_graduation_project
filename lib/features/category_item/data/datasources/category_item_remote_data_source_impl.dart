import '../../../../core/api/api_consumer.dart';
import '../../../../core/helpers/load_json_from_asset.dart';
import '../../../../core/shared_data/models/review_model.dart';
import 'category_item_remote_data_source.dart';

class CategoryItemRemoteDataSourceImpl implements CategoryItemRemoteDataSource {
  final APIConsumer apiConsumer;

  CategoryItemRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<List<ReviewModel>> getReviews(String itemId) async {
    final res = await loadJsonFromAsset('reviews.json');
    final reviews = List<ReviewModel>.from(res['data'].map(
      (review) => ReviewModel.fromJson(review),
    ));
    return reviews;
  }
}
