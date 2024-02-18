import '../../../domain/entities/conversation_entity.dart';
import '../../../domain/params/send_message_params.dart';
import '../../models/conversation_model.dart';
import '../../models/message_model.dart';

abstract class ConversationsRemoteDataSource {
  Future<void> sendMessage(SendMessageParams sendMessageParams);
  Stream<List<ConversationModel>> getConversations();
  Future<Stream<List<MessageModel>>> getConversationMessages(
    ConversationEntity conversationEntity,
  );
  Future<ConversationModel?> checkIfConversationExist(
      String otherParticipantId);
}
