import '../../../../../core/shared_data/models/job_model.dart';
import '../../../../../core/shared_data/models/property_model.dart';

abstract class SavedRemoteDataSource {
  Future<List<JobModel>> getSavedJobs();
  Future<List<PropertyModel>> getSavedProperties();
}
