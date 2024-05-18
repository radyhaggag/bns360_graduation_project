import '../../config/injector_container.dart';
import 'data/datasources/craftsman_remote_data_source.dart';
import 'data/datasources/craftsman_remote_data_source_impl.dart';
import 'data/repositories/craftsman_repo_impl.dart';
import 'domain/repositories/craftsman_repo.dart';
import 'presentation/bloc/craftsman_bloc.dart';

initCraftsman() {
  // Datasources
  sl.registerLazySingleton<CraftsmanRemoteDataSource>(
    () => CraftsmanRemoteDataSourceImpl(
      sl(),
    ),
  );
  // Repos
  sl.registerLazySingleton<CraftsmanRepo>(
    () => CraftsmanRepoImpl(
      craftsmanRemoteDataSource: sl(),
    ),
  );
  // Bloc
  sl.registerFactory(
    () => CraftsmanBloc(
      craftsmanRepo: sl(),
    ),
  );
}
