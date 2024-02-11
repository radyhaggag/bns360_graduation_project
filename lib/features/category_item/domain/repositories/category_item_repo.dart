import '../../../../core/shared_data/entities/review_entity.dart';
import '../../../../core/utils/custom_types.dart';

abstract class CategoryItemRepo {
  FutureEither<List<ReviewEntity>> getReviews(String itemId);
}
