import 'package:bns360_graduation_project/features/properties/params/add_property_params.dart';

import '../../../../core/helpers/execute_and_handle_error.dart';
import '../../../../core/shared_data/entities/property_entity.dart';
import '../../../../core/utils/custom_types.dart';
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

  @override
  FutureEither<void> addProperty(AddPropertyParams addPropertyParams) async {
    return executeAndHandleErrorAsync(
      () => propertiesRemoteDataSource.addProperty(addPropertyParams),
    );
  }

  @override
  FutureEither<void> editProperty(AddPropertyParams addPropertyParams) async {
    return executeAndHandleErrorAsync(
      () => propertiesRemoteDataSource.editProperty(addPropertyParams),
    );
  }
}
