import '../../config/injector_container.dart';
import 'data/datasources/local/home_local_data_source.dart';
import 'data/datasources/local/home_local_data_source_impl.dart';
import 'data/datasources/remote/home_remote_data_source.dart';
import 'data/datasources/remote/home_remote_data_source_impl.dart';
import 'data/repositories/home_repo_impl.dart';
import 'domain/repositories/home_repo.dart';
import 'domain/usecases/get_banners_use_case.dart';
import 'domain/usecases/get_categories_use_case.dart';
import 'domain/usecases/get_places_to_explore_use_case.dart';
import 'presentation/bloc/home_bloc.dart';

void initHome() {
  // Datasources
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(),
  );
  // Repos
  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(homeRemoteDataSource: sl(), homeLocalDataSource: sl()),
  );
  // Usecases
  sl.registerLazySingleton<GetBannersUseCase>(
    () => GetBannersUseCase(sl()),
  );
  sl.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(sl()),
  );
  sl.registerLazySingleton<GetPlacesToExploreUseCase>(
    () => GetPlacesToExploreUseCase(sl()),
  );
  // Bloc
  sl.registerFactory(
    () => HomeBloc(
      getBannersUseCase: sl(),
      getCategoriesUseCase: sl(),
      getPlacesToExploreUseCase: sl(),
    ),
  );
}
