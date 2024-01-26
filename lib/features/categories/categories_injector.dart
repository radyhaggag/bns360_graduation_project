import '../../config/injector_container.dart';
import 'data/datasources/remote/categories_remote_data_source.dart';
import 'data/datasources/remote/categories_remote_data_source_impl.dart';
import 'data/repositories/categories_repo_impl.dart';
import 'domain/repositories/categories_repo.dart';
import 'presentation/bloc/categories_bloc.dart';

initCategories() {
  // Datasources
  sl.registerLazySingleton<CategoriesRemoteDataSource>(
    () => CategoriesRemoteDataSourceImpl(sl()),
  );
  // Repo
  sl.registerLazySingleton<CategoriesRepo>(
    () => CategoriesRepoImpl(sl()),
  );

  // BLoc
  sl.registerFactory(
    () => CategoriesBloc(
      categoriesRepo: sl(),
    ),
  );
}
