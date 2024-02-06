import '../../config/injector_container.dart';
import 'data/datasources/remote/remote_profile_data_source.dart';
import 'data/datasources/remote/remote_profile_data_source_impl.dart';
import 'data/repositories/profile_repo_impl.dart';
import 'domain/repositories/profile_repo.dart';
import 'presentation/bloc/profile_bloc.dart';

initProfile() {
  // Datasources
  sl.registerLazySingleton<RemoteProfileDataSource>(
    () => RemoteProfileDataSourceImpl(
      apiConsumer: sl(),
    ),
  );
  // Repo
  sl.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(sl()),
  );
  // Bloc
  sl.registerFactory(
    () => ProfileBloc(
      profileRepo: sl(),
    ),
  );
}
