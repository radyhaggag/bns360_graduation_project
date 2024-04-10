import '../../../domain/params/add_job_params.dart';
import '../../models/job_model.dart';

abstract class JobsRemoteDataSource {
  Future<List<JobModel>> getJobs();
  Future<JobModel> getJobById(String id);
  Future<List<JobModel>> searchOnJobs(String text);
  Future<void> addJob(AddJobParams addJobParams);
}
