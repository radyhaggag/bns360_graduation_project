import '../../../../core/shared_data/entities/craft_entity.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../domain/params/add_service_params.dart';

abstract class MyServicesRemoteDataSource {
  Future<void> addService(AddServiceParams params);
  Future<List<CraftsmanEntity>> getMyServices();
  Future<List<CraftEntity>> getServiceCategories();
}
