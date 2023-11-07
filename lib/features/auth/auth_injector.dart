import '../../config/injector_container.dart';
import 'data/datasources/remote/auth_remote_data_source.dart';
import 'data/repositories/auth_repo_impl.dart';
import 'domain/repositories/auth_repo.dart';
import 'domain/usecases/login_use_case.dart';
import 'domain/usecases/register_use_case.dart';
import 'presentation/bloc/auth_bloc.dart';

void initAuth() {
  // Login Use case
  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(authRepo: sl()),
  );
  // Register Use case
  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(authRepo: sl()),
  );

  // Auth Repository
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      authRemoteDataSource: sl(),
      appShared: sl(),
    ),
  );

  // Auth Remote Data source
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiConsumer: sl()),
  );

  // Auth Bloc
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      registerUseCase: sl(),
      loginUseCase: sl(),
    ),
  );
}
