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
  FutureEither<List<JobModel>> getSavedJobs() {
    return executeAndHandleErrorAsync(
      () => savedRemoteDataSource.getSavedJobs(),
    );
  }

  @override
  FutureEither<List<PropertyEntity>> getSavedProperties() {
    return executeAndHandleErrorAsync(
      () => savedRemoteDataSource.getSavedProperties(),
    );
  }

  @override
  FutureEither<void> saveJob(int jobId) {
    return executeAndHandleErrorAsync(
      () => savedRemoteDataSource.saveJob(jobId),
    );
  }

  @override
  FutureEither<void> saveProperty(int propertyId) {
    return executeAndHandleErrorAsync(
      () => savedRemoteDataSource.saveProperty(propertyId),
    );
  }

  @override
  FutureEither<void> unSaveJob(int jobId) {
    return executeAndHandleErrorAsync(
      () => savedRemoteDataSource.unSaveJob(jobId),
    );
  }

  @override
  FutureEither<void> unSaveProperty(int propertyId) {
    return executeAndHandleErrorAsync(
      () => savedRemoteDataSource.unSaveProperty(propertyId),
    );
  }
}
