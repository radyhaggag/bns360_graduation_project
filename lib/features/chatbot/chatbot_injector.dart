import 'package:bns360_graduation_project/config/injector_container.dart';
import 'package:bns360_graduation_project/features/chatbot/data/datasources/chatbot_data_source.dart';
import 'package:bns360_graduation_project/features/chatbot/data/repositories/chatbot_repo_impl.dart';
import 'package:bns360_graduation_project/features/chatbot/domain/repositories/chatbot_repo.dart';
import 'package:bns360_graduation_project/features/chatbot/presentation/bloc/chatbot_bloc.dart';

initChatbot() {
  sl.registerLazySingleton<ChatbotDataSource>(() {
    return ChatbotDataSourceImpl();
  });

  sl.registerLazySingleton<ChatbotRepo>(() {
    return ChatbotRepoImpl(chatbotDataSource: sl());
  });

  sl.registerFactory(() {
    return ChatbotBloc(chatbotRepo: sl());
  });
}
