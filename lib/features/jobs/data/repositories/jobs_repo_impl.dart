import '../../../../core/helpers/execute_and_handle_error.dart';
import '../../../../core/utils/custom_types.dart';
import '../../domain/entities/job_entity.dart';
import '../../domain/repositories/jobs_repo.dart';
import '../datasources/remote/jobs_remote_data_source.dart';

class JobsRepoImpl implements JobsRepo {
  final JobsRemoteDataSource jobsRemoteDataSource;

  JobsRepoImpl(this.jobsRemoteDataSource);

  @override
  FutureEither<List<JobEntity>> getJobs() async {
    return executeAndHandleErrorAsync(
      () => jobsRemoteDataSource.getJobs(),
    );
  }

  @override
  FutureEither<JobEntity> getJobById(String id) async {
    return executeAndHandleErrorAsync(
      () => jobsRemoteDataSource.getJobById(id),
    );
  }

  @override
  FutureEither<List<JobEntity>> searchOnJobs(
    String text,
  ) async {
    return executeAndHandleErrorAsync(
      () => jobsRemoteDataSource.searchOnJobs(text),
    );
  }
}
