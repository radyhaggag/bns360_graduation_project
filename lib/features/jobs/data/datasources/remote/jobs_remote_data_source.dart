import '../../../../../core/shared_data/entities/job_entity.dart';
import '../../../../../core/shared_data/models/job_model.dart';
import '../../../domain/params/add_job_params.dart';

abstract class JobsRemoteDataSource {
  Future<List<JobModel>> getJobs();

  Future<JobModel> getJobById(String id);

  Future<void> addJob(AddJobParams addJobParams);

  Future<void> editJob(JobEntity job);
}
