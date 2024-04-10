import '../../../../core/utils/custom_types.dart';
import '../entities/job_entity.dart';
import '../params/add_job_params.dart';

abstract class JobsRepo {
  FutureEither<List<JobEntity>> getJobs();
  FutureEither<JobEntity> getJobById(String id);
  FutureEither<List<JobEntity>> searchOnJobs(String text);
  FutureEither<void> addJob(AddJobParams addJobParams);
}
