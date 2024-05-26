import '../../../../core/shared_data/entities/craft_entity.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../core/utils/custom_types.dart';

abstract class CraftsRepo {
  FutureEither<List<CraftEntity>> getCrafts();
  FutureEither<List<CraftsmanEntity>> getCraftsmen();
  FutureEither<List<CraftsmanEntity>> getCraftItemsById(int id);
  FutureEither<List<CraftsmanEntity>> searchOnCraftsById(int id, String text);
  FutureEither<List<CraftsmanEntity>> searchOnAllCrafts(String text);
}
