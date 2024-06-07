import '../../../../core/utils/custom_types.dart';
import '../../../conversations/domain/entities/message_entity.dart';

abstract class ChatbotRepo {
  FutureEither<void> sendMessage(String message);
  ResultOrFailure<Stream<List<MessageEntity>>> getConversationMessages();
}
