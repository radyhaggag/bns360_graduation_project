import '../../../domain/params/reset_unread_count_params.dart';
import '../../../domain/params/send_message_params.dart';
import '../../models/conversation_model.dart';
import '../../models/message_model.dart';

abstract class ConversationsRemoteDataSource {
  Future<String?> sendMessage(SendMessageParams sendMessageParams);
  Stream<List<ConversationModel>> getConversations();
  Future<Stream<List<MessageModel>>> getConversationMessages(
    String conversationId,
  );
  Future<ConversationModel?> checkIfConversationExist(
    String otherParticipantId,
  );
  Future<void> resetUnreadCountForCurrentUser(
    ResetUnreadCountParams resetUnreadCountParams,
  );
}
