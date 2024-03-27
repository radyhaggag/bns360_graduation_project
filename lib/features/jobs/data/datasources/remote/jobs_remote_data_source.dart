import '../../models/job_model.dart';

abstract class JobsRemoteDataSource {
  Future<List<JobModel>> getJobs();
  Future<JobModel> getJobById(String id);
  Future<List<JobModel>> searchOnJobs(String text);
}
