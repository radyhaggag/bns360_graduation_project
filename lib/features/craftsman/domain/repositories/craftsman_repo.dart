import '../../../../core/shared_data/entities/review_entity.dart';
import '../../../../core/utils/custom_types.dart';

abstract class CraftsmanRepo {
  FutureEither<List<ReviewEntity>> getReviews(String itemId);
}
