import 'package:bns360_graduation_project/core/utils/app_endpoints.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/shared_data/models/craft_model.dart';
import '../../../../../core/shared_data/models/craftsman_info_model.dart';
import 'crafts_remote_data_source.dart';

class CraftsRemoteDataSourceImpl implements CraftsRemoteDataSource {
  final APIConsumer apiConsumer;

  CraftsRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<List<CraftModel>> getCrafts() async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getAllCrafts,
    );
    final crafts = List<CraftModel>.from(res.data.map(
      (craft) => CraftModel.fromJson(craft),
    ));
    return crafts;
  }

  @override
  Future<List<CraftsmanInfoModel>> getCraftItemsById(int craftId) async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getCraftItemsById(craftId),
    );
    final craftsmen = List<CraftsmanInfoModel>.from(res.data.map(
      (craftsman) => CraftsmanInfoModel.fromJson(craftsman),
    ));
    return craftsmen;
  }
}
