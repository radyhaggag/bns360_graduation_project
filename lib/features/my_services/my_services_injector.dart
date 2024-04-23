import '../../config/injector_container.dart';
import 'data/datasources/my_services_remote_data_source.dart';
import 'data/datasources/my_services_remote_data_source_impl.dart';
import 'data/repositories/my_services_repo_impl.dart';
import 'domain/repositories/my_services_repo.dart';
import 'presentation/bloc/my_services_bloc.dart';

initMyServices() {
  // Datasources
  sl.registerLazySingleton<MyServicesRemoteDataSource>(
    () => MyServicesRemoteDataSourceImpl(apiConsumer: sl()),
  );
  // Repos
  sl.registerLazySingleton<MyServicesRepo>(
    () => MyServicesRepoImpl(myServicesRemoteDataSource: sl()),
  );
  // Blocs
  sl.registerFactory(
    () => MyServicesBloc(myServicesRepo: sl()),
  );
}
