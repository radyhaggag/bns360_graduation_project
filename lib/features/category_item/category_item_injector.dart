import '../../config/injector_container.dart';
import 'data/datasources/category_item_remote_data_source.dart';
import 'data/datasources/category_item_remote_data_source_impl.dart';
import 'data/repositories/category_item_repo_impl.dart';
import 'domain/repositories/category_item_repo.dart';
import 'presentation/bloc/category_item_bloc.dart';

void initCategoryItem() {
  // Datasources
  sl.registerLazySingleton<CategoryItemRemoteDataSource>(
    () => CategoryItemRemoteDataSourceImpl(
      sl(),
    ),
  );
  // Repos
  sl.registerLazySingleton<CategoryItemRepo>(
    () => CategoryItemRepoImpl(
      categoryItemRemoteDataSource: sl(),
    ),
  );
  // Bloc
  sl.registerFactory(
    () => CategoryItemBloc(
      categoryItemRepo: sl(),
    ),
  );
}
