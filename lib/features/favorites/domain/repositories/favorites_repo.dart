import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../core/utils/custom_types.dart';

abstract class FavoritesRepo {
  FutureEither<List<CategoryItemEntity>> getFavoriteCategories();
  FutureEither<List<CraftsmanEntity>> getFavoriteCraftsmen();
  FutureEither<void> addCategoryItemToFavorite(int itemId);
  FutureEither<void> removeCategoryItemFromFavorite(int itemId);
  FutureEither<void> addCraftsmanToFavorite(int itemId);
  FutureEither<void> removeCraftsmanFromFavorite(int itemId);
}
