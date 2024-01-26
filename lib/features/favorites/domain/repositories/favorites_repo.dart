import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../core/utils/custom_types.dart';

abstract class FavoritesRepo {
  FutureEither<List<CategoryItemEntity>> getFavoriteCategories();
  FutureEither<List<CraftsmanEntity>> getFavoriteCraftsmen();
}
