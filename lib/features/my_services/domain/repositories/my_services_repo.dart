import '../../../../core/shared_data/entities/craft_entity.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../core/utils/custom_types.dart';
import '../params/add_service_params.dart';

abstract class MyServicesRepo {
  FutureEither<void> addService(AddServiceParams params);
  FutureEither<List<CraftsmanEntity>> getMyServices();
  FutureEither<List<CraftEntity>> getServiceCategories();
}
