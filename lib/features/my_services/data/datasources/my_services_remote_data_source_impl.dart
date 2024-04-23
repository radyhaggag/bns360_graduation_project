import '../../../../core/api/api_consumer.dart';
import '../../../../core/helpers/load_json_from_asset.dart';
import '../../../../core/shared_data/models/craft_model.dart';
import '../../../../core/shared_data/models/craftsman_model.dart';
import '../../domain/params/add_service_params.dart';
import 'my_services_remote_data_source.dart';

class MyServicesRemoteDataSourceImpl implements MyServicesRemoteDataSource {
  final APIConsumer apiConsumer;

  MyServicesRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<void> addService(AddServiceParams params) {
    // TODO: implement addService
    throw UnimplementedError();
  }

  @override
  Future<List<CraftModel>> getServiceCategories() async {
    final res = await loadJsonFromAsset('crafts.json');
    final crafts = List<CraftModel>.from(res['data'].map(
      (category) => CraftModel.fromJson(category),
    ));
    return crafts;
  }

  @override
  Future<List<CraftsmanModel>> getMyServices() async {
    final res = await loadJsonFromAsset('craftsmen.json');
    final items = List<CraftsmanModel>.from(res['data'].map(
      (item) => CraftsmanModel.fromJson(item),
    ));
    return items;
  }
}
