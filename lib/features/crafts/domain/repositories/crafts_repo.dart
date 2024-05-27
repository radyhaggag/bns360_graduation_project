import '../../../../core/shared_data/entities/craft_entity.dart';
import '../../../../core/shared_data/entities/craftsman_info_entity.dart';
import '../../../../core/utils/custom_types.dart';

abstract class CraftsRepo {
  FutureEither<List<CraftEntity>> getCrafts();
  FutureEither<List<CraftsmanInfoEntity>> getCraftItemsById(int id);
}
