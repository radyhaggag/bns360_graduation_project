import 'data/datasources/remote/favorites_remote_data_source_impl.dart';

import '../../config/injector_container.dart';
import 'data/datasources/remote/favorites_remote_data_source.dart';
import 'data/repositories/favorites_repo_impl.dart';
import 'domain/repositories/favorites_repo.dart';
import 'presentation/bloc/favorites_bloc.dart';

initFavorites() {
  // Datasources
  sl.registerLazySingleton<FavoritesRemoteDataSource>(
    () => FavoritesRemoteDataSourceImpl(sl()),
  );
  // Repos
  sl.registerLazySingleton<FavoritesRepo>(
    () => FavoritesRepoImpl(sl()),
  );
  // Bloc
  sl.registerFactory(
    () => FavoritesBloc(
      favoritesRepo: sl(),
    ),
  );
}
