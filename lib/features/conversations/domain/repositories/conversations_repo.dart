import '../../../../core/utils/custom_types.dart';
import '../entities/conversation_entity.dart';
import '../entities/message_entity.dart';
import '../params/send_message_params.dart';

abstract class ConversationsRepo {
  FutureEither<void> sendMessage(SendMessageParams sendMessageParams);
  ResultOrFailure<Stream<List<ConversationEntity>>> getConversations();
  FutureEither<Stream<List<MessageEntity>>> getConversationMessages(
    ConversationEntity conversationEntity,
  );
  FutureEither<ConversationEntity?> checkIfConversationExist(
    String otherParticipantId,
  );
}
