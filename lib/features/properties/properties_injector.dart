import '../../config/injector_container.dart';
import 'data/datasources/remote/properties_remote_data_source.dart';
import 'data/datasources/remote/properties_remote_data_source_impl.dart';
import 'data/repositories/properties_repo_impl.dart';
import 'domain/repositories/properties_repo.dart';
import 'presentation/bloc/properties_bloc.dart';

initProperties() {
  // repos
  sl.registerLazySingleton<PropertiesRemoteDataSource>(
    () => PropertiesRemoteDataSourceImpl(sl()),
  );

  // repos
  sl.registerLazySingleton<PropertiesRepo>(
    () => PropertiesRepoImpl(sl()),
  );

  sl.registerFactory(
    () => PropertiesBloc(
      propertiesRepo: sl(),
    ),
  );
}
