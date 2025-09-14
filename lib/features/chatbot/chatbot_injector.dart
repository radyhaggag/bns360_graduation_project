import '../../config/injector_container.dart';
import 'data/datasources/chatbot_data_source.dart';
import 'data/repositories/chatbot_repo_impl.dart';
import 'domain/repositories/chatbot_repo.dart';
import 'presentation/bloc/chatbot_bloc.dart';

void initChatbot() {
  sl.registerLazySingleton<ChatbotDataSource>(() {
    return ChatbotDataSourceImpl(
      apiConsumer: sl(),
    );
  });

  sl.registerLazySingleton<ChatbotRepo>(() {
    return ChatbotRepoImpl(chatbotDataSource: sl());
  });

  sl.registerFactory(() {
    return ChatbotBloc(chatbotRepo: sl());
  });
}
