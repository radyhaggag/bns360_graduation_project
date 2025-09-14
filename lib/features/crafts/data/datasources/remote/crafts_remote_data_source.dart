import '../../../../../core/shared_data/models/craft_model.dart';
import '../../../../../core/shared_data/models/craftsman_info_model.dart';

abstract class CraftsRemoteDataSource {
  Future<List<CraftModel>> getCrafts();
  Future<List<CraftsmanInfoModel>> getCraftItemsById(int id);
}
