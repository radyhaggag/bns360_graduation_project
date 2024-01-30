import '../../../../../core/shared_data/models/craft_model.dart';
import '../../../../../core/shared_data/models/craftsman_model.dart';

abstract class CraftsRemoteDataSource {
  Future<List<CraftModel>> getCrafts();
  Future<List<CraftsmanModel>> getCraftsmen();
  Future<List<CraftsmanModel>> getCraftItemsById(int id);
  Future<List<CraftsmanModel>> searchOnCraftsById(int id, String text);
  Future<List<CraftsmanModel>> searchOnAllCrafts(String text);
}
