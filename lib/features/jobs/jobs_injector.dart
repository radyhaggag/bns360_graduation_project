import '../../config/injector_container.dart';
import 'data/datasources/remote/jobs_remote_data_source.dart';
import 'data/datasources/remote/jobs_remote_data_source_impl.dart';
import 'data/repositories/jobs_repo_impl.dart';
import 'domain/repositories/jobs_repo.dart';
import 'presentation/bloc/jobs_bloc.dart';

void initJobs() {
  // repos
  sl.registerLazySingleton<JobsRemoteDataSource>(
    () => JobsRemoteDataSourceImpl(sl()),
  );

  // repos
  sl.registerLazySingleton<JobsRepo>(
    () => JobsRepoImpl(sl()),
  );

  sl.registerFactory(
    () => JobsBloc(
      jobsRepo: sl(),
    ),
  );
}
