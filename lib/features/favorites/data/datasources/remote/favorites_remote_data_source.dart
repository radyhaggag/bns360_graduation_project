import '../../../../../core/shared_data/models/category_item_model.dart';
import '../../../../../core/shared_data/models/craftsman_model.dart';

abstract class FavoritesRemoteDataSource {
  Future<List<CategoryItemModel>> getFavoriteCategories();
  Future<List<CraftsmanModel>> getFavoriteCraftsmen();
  Future<void> addCategoryItemToFavorite(int itemId);
  Future<void> removeCategoryItemFromFavorite(int itemId);
  Future<void> addCraftsmanToFavorite(int itemId);
  Future<void> removeCraftsmanFromFavorite(int itemId);
}
