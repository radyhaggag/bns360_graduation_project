import '../../config/injector_container.dart';
import 'data/datasources/remote/auth_remote_data_source.dart';
import 'data/repositories/auth_repo_impl.dart';
import 'domain/repositories/auth_repo.dart';
import 'presentation/bloc/auth_bloc.dart';

void initAuth() {
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      authRemoteDataSource: sl(),
      secureStorageManager: sl(),
    ),
  );

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiConsumer: sl()),
  );

  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      authRepo: sl(),
    ),
  );
}
