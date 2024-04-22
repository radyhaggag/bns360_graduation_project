import '../../../../../core/shared_data/models/job_model.dart';
import '../../../domain/params/add_job_params.dart';

abstract class JobsRemoteDataSource {
  Future<List<JobModel>> getJobs();
  Future<JobModel> getJobById(String id);
  Future<List<JobModel>> searchOnJobs(String text);
  Future<void> addJob(AddJobParams addJobParams);
  Future<void> editJob(AddJobParams addJobParams);
}
