import '../../config/injector_container.dart';
import 'data/datasources/my_business_remote_data_source.dart';
import 'data/datasources/my_business_remote_data_source_impl.dart';
import 'data/repositories/my_business_repo_impl.dart';
import 'domain/repositories/my_business_repo.dart';
import 'presentation/bloc/my_business_bloc.dart';

initMyBusiness() {
  // Datasources
  sl.registerLazySingleton<MyBusinessRemoteDataSource>(
    () => MyBusinessRemoteDataSourceImpl(apiConsumer: sl()),
  );
  // Repos
  sl.registerLazySingleton<MyBusinessRepo>(
    () => MyBusinessRepoImpl(myBusinessRemoteDataSource: sl()),
  );
  // Blocs
  sl.registerFactory(
    () => MyBusinessBloc(myBusinessRepo: sl()),
  );
}
