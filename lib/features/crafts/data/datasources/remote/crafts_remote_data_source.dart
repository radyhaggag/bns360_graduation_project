import '../../../../../core/shared_data/models/craft_model.dart';
import '../../../../../core/shared_data/models/craftsman_model.dart';

abstract class CraftsRemoteDataSource {
  Future<List<CraftModel>> getCrafts();
  Future<List<CraftsmanModel>> getCraftsmen();
  Future<List<CraftsmanModel>> getCraftItemsById(String id);
  Future<List<CraftsmanModel>> searchOnCraftsById(String id, String text);
  Future<List<CraftsmanModel>> searchOnAllCrafts(String text);
}
