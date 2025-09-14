import '../../config/injector_container.dart';
import 'data/datasources/remote/my_posts_remote_data_source.dart';
import 'data/datasources/remote/my_posts_remote_data_source_impl.dart';
import 'data/repositories/my_posts_repo_impl.dart';
import 'domain/repositories/my_posts_repo.dart';
import 'presentation/bloc/my_posts_bloc.dart';

void initMyPosts() {
  // Datasources
  sl.registerLazySingleton<MyPostsRemoteDataSource>(
    () => MyPostsRemoteDataSourceImpl(sl()),
  );
  // Repos
  sl.registerLazySingleton<MyPostsRepo>(
    () => MyPostsRepoImpl(sl()),
  );
  // Bloc
  sl.registerFactory(
    () => MyPostsBloc(
      myPostsRepo: sl(),
    ),
  );
}
