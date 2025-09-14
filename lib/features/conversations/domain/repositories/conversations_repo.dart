import '../../../../core/utils/custom_types.dart';
import '../entities/conversation_entity.dart';
import '../entities/message_entity.dart';
import '../params/delete_message_params.dart';
import '../params/reset_unread_count_params.dart';
import '../params/send_message_params.dart';

abstract class ConversationsRepo {
  FutureEither<String?> sendMessage(SendMessageParams sendMessageParams);
  ResultOrFailure<Stream<List<ConversationEntity>>> getConversations(
    String currentUserId,
  );
  FutureEither<Stream<List<MessageEntity>>> getConversationMessages(
    String conversationId,
  );
  FutureEither<ConversationEntity?> checkIfConversationExist(
    String otherParticipantId,
  );
  FutureEither<void> resetUnreadCountForCurrentUser(
    ResetUnreadCountParams resetUnreadCountParams,
  );
  FutureEither<void> deleteMessage(
    DeleteMessageParams deleteMessageParams,
  );
}
