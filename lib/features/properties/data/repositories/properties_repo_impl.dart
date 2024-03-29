import '../../../../core/helpers/execute_and_handle_error.dart';
import '../../../../core/utils/custom_types.dart';
import '../../domain/entities/property_entity.dart';
import '../../domain/repositories/properties_repo.dart';
import '../datasources/remote/properties_remote_data_source.dart';

class PropertiesRepoImpl implements PropertiesRepo {
  final PropertiesRemoteDataSource propertiesRemoteDataSource;

  PropertiesRepoImpl(this.propertiesRemoteDataSource);

  @override
  FutureEither<List<PropertyEntity>> getProperties() async {
    return executeAndHandleErrorAsync(
      () => propertiesRemoteDataSource.getProperties(),
    );
  }

  @override
  FutureEither<PropertyEntity> getPropertyById(String id) async {
    return executeAndHandleErrorAsync(
      () => propertiesRemoteDataSource.getPropertyById(id),
    );
  }

  @override
  FutureEither<List<PropertyEntity>> searchOnProperties(
    String text,
  ) async {
    return executeAndHandleErrorAsync(
      () => propertiesRemoteDataSource.searchOnProperties(text),
    );
  }
}
