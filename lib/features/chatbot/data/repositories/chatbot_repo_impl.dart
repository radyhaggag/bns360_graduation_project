import '../../../../core/helpers/execute_and_handle_error.dart';
import '../../../../core/utils/custom_types.dart';
import '../../../conversations/domain/entities/message_entity.dart';

import '../../domain/repositories/chatbot_repo.dart';
import '../datasources/chatbot_data_source.dart';

class ChatbotRepoImpl implements ChatbotRepo {
  final ChatbotDataSource chatbotDataSource;

  ChatbotRepoImpl({required this.chatbotDataSource});

  @override
  ResultOrFailure<Stream<List<MessageEntity>>> getConversationMessages() {
    return executeAndHandleError(() {
      return chatbotDataSource.getConversationMessages();
    });
  }

  @override
  FutureEither<void> sendMessage(String message) {
    return executeAndHandleErrorAsync(() {
      return chatbotDataSource.sendMessage(message);
    });
  }
}
