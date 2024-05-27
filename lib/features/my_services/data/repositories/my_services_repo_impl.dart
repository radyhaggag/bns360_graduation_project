import '../../../../core/helpers/execute_and_handle_error.dart';
import '../../../../core/shared_data/entities/craft_entity.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../core/utils/custom_types.dart';
import '../../domain/params/add_service_params.dart';
import '../../domain/repositories/my_services_repo.dart';
import '../datasources/my_services_remote_data_source.dart';

class MyServicesRepoImpl implements MyServicesRepo {
  final MyServicesRemoteDataSource myServicesRemoteDataSource;

  MyServicesRepoImpl({
    required this.myServicesRemoteDataSource,
  });

  @override
  FutureEither<void> addService(AddServiceParams params) async {
    return executeAndHandleErrorAsync(
      () => myServicesRemoteDataSource.addService(params),
    );
  }

  @override
  FutureEither<List<CraftEntity>> getServiceCategories() {
    return executeAndHandleErrorAsync(
      () => myServicesRemoteDataSource.getServiceCategories(),
    );
  }

  @override
  FutureEither<List<CraftsmanEntity>> getMyServices() {
    return executeAndHandleErrorAsync(
      () => myServicesRemoteDataSource.getMyServices(),
    );
  }

  @override
  FutureEither<void> updateService(CraftsmanEntity params) {
    return executeAndHandleErrorAsync(
      () => myServicesRemoteDataSource.updateService(params),
    );
  }
}
