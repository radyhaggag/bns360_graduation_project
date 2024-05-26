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
    return executeAndHandleErrorAsync(
      () => favoritesRemoteDataSource.getFavoriteCategories(),
    );
  }

  @override
  FutureEither<List<CraftsmanEntity>> getFavoriteCraftsmen() async {
    return executeAndHandleErrorAsync(
      () => favoritesRemoteDataSource.getFavoriteCraftsmen(),
    );
  }

  @override
  FutureEither<void> addCategoryItemToFavorite(int itemId) async {
    return executeAndHandleErrorAsync(
      () => favoritesRemoteDataSource.addCategoryItemToFavorite(itemId),
    );
  }

  @override
  FutureEither<void> removeCategoryItemFromFavorite(int itemId) async {
    return executeAndHandleErrorAsync(
      () => favoritesRemoteDataSource.removeCategoryItemFromFavorite(itemId),
    );
  }

  @override
  FutureEither<void> addCraftsmanToFavorite(int itemId) async {
    return executeAndHandleErrorAsync(
      () => favoritesRemoteDataSource.addCraftsmanToFavorite(itemId),
    );
  }

  @override
  FutureEither<void> removeCraftsmanFromFavorite(int itemId) async {
    return executeAndHandleErrorAsync(
      () => favoritesRemoteDataSource.removeCraftsmanFromFavorite(itemId),
    );
  }
}
