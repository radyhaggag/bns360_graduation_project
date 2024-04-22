import '../../../../core/helpers/execute_and_handle_error.dart';
import '../../../../core/shared_data/entities/property_entity.dart';
import '../../../../core/shared_data/models/job_model.dart';
import '../../../../core/utils/custom_types.dart';
import '../../domain/repositories/saved_repo.dart';
import '../datasources/remote/saved_remote_data_source.dart';

class SavedRepoImpl implements SavedRepo {
  final SavedRemoteDataSource savedRemoteDataSource;

  SavedRepoImpl(this.savedRemoteDataSource);

  @override
  FutureEither<List<JobModel>> getSavedJobs() async {
    return executeAndHandleErrorAsync(
      () => savedRemoteDataSource.getSavedJobs(),
    );
  }

  @override
  FutureEither<List<PropertyEntity>> getSavedProperties() async {
    return executeAndHandleErrorAsync(
      () => savedRemoteDataSource.getSavedProperties(),
    );
  }
}
