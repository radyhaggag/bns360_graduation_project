import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/helpers/load_json_from_asset.dart';
import '../../models/property_model.dart';
import 'properties_remote_data_source.dart';

class PropertiesRemoteDataSourceImpl implements PropertiesRemoteDataSource {
  final APIConsumer apiConsumer;

  PropertiesRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<List<PropertyModel>> getProperties() async {
    final res = await loadJsonFromAsset('properties.json');
    final crafts = List<PropertyModel>.from(res['data'].map(
      (craft) => PropertyModel.fromJson(craft),
    ));
    return crafts;
  }

  @override
  Future<PropertyModel> getPropertyById(String id) async {
    final res = await loadJsonFromAsset('properties.json');
    final properties = List<PropertyModel>.from(res['data'].map(
      (craftsman) => PropertyModel.fromJson(craftsman),
    ));
    final item = properties.firstWhere((item) => item.id == id);
    return item;
  }

  @override
  Future<List<PropertyModel>> searchOnProperties(String text) async {
    final res = await loadJsonFromAsset('properties.json');
    final craftsmen = List<PropertyModel>.from(res['data'].map(
      (craftsman) => PropertyModel.fromJson(craftsman),
    ));
    final searchLowercase = text.toLowerCase();
    bool isTrue(String itemName) {
      final itemNameLowercase = itemName.toLowerCase();
      return searchLowercase.contains(itemNameLowercase) ||
          itemNameLowercase.contains(searchLowercase);
    }

    final filteredItems =
        craftsmen.where((item) => isTrue(item.location)).toList();
    return filteredItems;
  }
}
