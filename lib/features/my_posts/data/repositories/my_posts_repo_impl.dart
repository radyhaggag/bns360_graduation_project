import '../../../../core/helpers/execute_and_handle_error.dart';
import '../../../../core/shared_data/entities/property_entity.dart';
import '../../../../core/shared_data/models/job_model.dart';
import '../../../../core/utils/custom_types.dart';
import '../../domain/repositories/my_posts_repo.dart';
import '../datasources/remote/my_posts_remote_data_source.dart';

class MyPostsRepoImpl implements MyPostsRepo {
  final MyPostsRemoteDataSource myPostsRemoteDataSource;

  MyPostsRepoImpl(this.myPostsRemoteDataSource);

  @override
  FutureEither<List<JobModel>> getMyPostsJobs() async {
    return executeAndHandleErrorAsync(
      () => myPostsRemoteDataSource.getMyPostsJobs(),
    );
  }

  @override
  FutureEither<List<PropertyEntity>> getMyPostsProperties() async {
    return executeAndHandleErrorAsync(
      () => myPostsRemoteDataSource.getMyPostsProperties(),
    );
  }
}
