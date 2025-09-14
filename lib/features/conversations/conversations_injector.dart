import '../../config/injector_container.dart';
import 'data/datasources/remote/conversations_remote_data_source.dart';
import 'data/datasources/remote/conversations_remote_data_source_impl.dart';
import 'data/repositories/conversations_repo_impl.dart';
import 'domain/repositories/conversations_repo.dart';
import 'presentation/bloc/conversations_bloc.dart';

void initConversations() {
  // Datasources
  sl.registerLazySingleton<ConversationsRemoteDataSource>(
    () => ConversationsRemoteDataSourceImpl(),
  );

  // Repo
  sl.registerLazySingleton<ConversationsRepo>(
    () => ConversationsRepoImpl(sl()),
  );

  // Bloc
  sl.registerFactory(
    () => ConversationsBloc(
      conversationsRepo: sl(),
    ),
  );
}
