import '../../../../core/shared_data/models/review_model.dart';

abstract class CategoryItemRemoteDataSource {
  Future<List<ReviewModel>> getReviews(String itemId);
}
