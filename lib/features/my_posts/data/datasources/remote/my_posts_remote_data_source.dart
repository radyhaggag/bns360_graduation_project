import '../../../../../core/shared_data/models/job_model.dart';
import '../../../../../core/shared_data/models/property_model.dart';

abstract class MyPostsRemoteDataSource {
  Future<List<JobModel>> getMyPostsJobs();
  Future<List<PropertyModel>> getMyPostsProperties();
}
