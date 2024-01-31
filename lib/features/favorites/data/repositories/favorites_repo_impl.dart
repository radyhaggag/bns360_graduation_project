import '../../../../core/helpers/execute_and_handle_error.dart';
import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../core/utils/custom_types.dart';
import '../../domain/repositories/favorites_repo.dart';
import '../datasources/remote/favorites_remote_data_source.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  final FavoritesRemoteDataSource favoritesRemoteDataSource;

  FavoritesRepoImpl(this.favoritesRemoteDataSource);

  @override
  FutureEither<List<CategoryItemEntity>> getFavoriteCategories() async {
    return executeAndHandleError(
      () => favoritesRemoteDataSource.getFavoriteCategories(),
    );
  }

  @override
  FutureEither<List<CraftsmanEntity>> getFavoriteCraftsmen() async {
    return executeAndHandleError(
      () => favoritesRemoteDataSource.getFavoriteCraftsmen(),
    );
  }
}
