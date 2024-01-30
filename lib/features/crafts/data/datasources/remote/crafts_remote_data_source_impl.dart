import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/helpers/load_json_from_asset.dart';
import '../../../../../core/shared_data/models/craft_model.dart';
import '../../../../../core/shared_data/models/craftsman_model.dart';
import 'crafts_remote_data_source.dart';

class CraftsRemoteDataSourceImpl implements CraftsRemoteDataSource {
  final APIConsumer apiConsumer;

  CraftsRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<List<CraftModel>> getCrafts() async {
    final res = await loadJsonFromAsset('crafts.json');
    final crafts = List<CraftModel>.from(res['data'].map(
      (craft) => CraftModel.fromJson(craft),
    ));
    return crafts;
  }

  @override
  Future<List<CraftsmanModel>> getCraftsmen() async {
    final res = await loadJsonFromAsset('craftsmen.json');
    final craftsmen = List<CraftsmanModel>.from(res['data'].map(
      (craftsman) => CraftsmanModel.fromJson(craftsman),
    ));
    return craftsmen;
  }

  @override
  Future<List<CraftsmanModel>> getCraftItemsById(int id) async {
    final res = await loadJsonFromAsset('craftsmen.json');
    final craftsmen = List<CraftsmanModel>.from(res['data'].map(
      (craftsman) => CraftsmanModel.fromJson(craftsman),
    ));
    final filteredItems = craftsmen.where((item) => item.id == id).toList();
    return filteredItems;
  }

  @override
  Future<List<CraftsmanModel>> searchOnAllCrafts(String text) async {
    final res = await loadJsonFromAsset('craftsmen.json');
    final craftsmen = List<CraftsmanModel>.from(res['data'].map(
      (craftsman) => CraftsmanModel.fromJson(craftsman),
    ));
    final searchLowercase = text.toLowerCase();
    bool isTrue(String itemName) {
      final itemNameLowercase = itemName.toLowerCase();
      return searchLowercase.contains(itemNameLowercase) ||
          itemNameLowercase.contains(searchLowercase);
    }

    final filteredItems = craftsmen.where((item) => isTrue(item.name)).toList();
    return filteredItems;
  }

  @override
  Future<List<CraftsmanModel>> searchOnCraftsById(int id, String text) async {
    final res = await loadJsonFromAsset('craftsmen.json');
    final craftsmen = List<CraftsmanModel>.from(res['data'].map(
      (craftsman) => CraftsmanModel.fromJson(craftsman),
    ));
    final searchLowercase = text.toLowerCase();
    bool isTrue(String itemName, int itemId) {
      if (id != itemId) return false;
      final itemNameLowercase = itemName.toLowerCase();
      return searchLowercase.contains(itemNameLowercase) ||
          itemNameLowercase.contains(searchLowercase);
    }

    final filteredItems = craftsmen.where((item) {
      return isTrue(item.name, item.id);
    }).toList();
    return filteredItems;
  }
}
