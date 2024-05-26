import '../../../../core/helpers/execute_and_handle_error.dart';
import '../../../../core/shared_data/entities/review_entity.dart';
import '../../../../core/utils/custom_types.dart';
import '../../domain/repositories/craftsman_repo.dart';
import '../datasources/craftsman_remote_data_source.dart';

class CraftsmanRepoImpl implements CraftsmanRepo {
  final CraftsmanRemoteDataSource craftsmanRemoteDataSource;

  CraftsmanRepoImpl({required this.craftsmanRemoteDataSource});

  @override
  FutureEither<List<ReviewEntity>> getReviews(int itemId) {
    return executeAndHandleErrorAsync(
      () => craftsmanRemoteDataSource.getReviews(itemId),
    );
  }

  @override
  FutureEither<void> removeReview(int itemId, int reviewId) {
    return executeAndHandleErrorAsync(
      () => craftsmanRemoteDataSource.removeReview(itemId, reviewId),
    );
  }
}
