import '../../config/injector_container.dart';
import 'data/datasources/remote/crafts_remote_data_source.dart';
import 'data/datasources/remote/crafts_remote_data_source_impl.dart';
import 'data/repositories/crafts_repo_impl.dart';
import 'domain/repositories/crafts_repo.dart';
import 'presentation/bloc/crafts_bloc.dart';

void initCrafts() {
  // Datasources
  sl.registerLazySingleton<CraftsRemoteDataSource>(
    () => CraftsRemoteDataSourceImpl(sl()),
  );
  // Repos
  sl.registerLazySingleton<CraftsRepo>(
    () => CraftsRepoImpl(sl()),
  );
  // Bloc
  sl.registerFactory(
    () => CraftsBloc(
      craftsRepo: sl(),
    ),
  );
}
