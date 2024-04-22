import '../../config/injector_container.dart';
import 'data/datasources/remote/saved_remote_data_source.dart';
import 'data/datasources/remote/saved_remote_data_source_impl.dart';
import 'data/repositories/saved_repo_impl.dart';
import 'domain/repositories/saved_repo.dart';
import 'presentation/bloc/saved_bloc.dart';

initSaved() {
  // Datasources
  sl.registerLazySingleton<SavedRemoteDataSource>(
    () => SavedRemoteDataSourceImpl(sl()),
  );
  // Repos
  sl.registerLazySingleton<SavedRepo>(
    () => SavedRepoImpl(sl()),
  );
  // Bloc
  sl.registerFactory(
    () => SavedBloc(
      savedRepo: sl(),
    ),
  );
}
