import '../../../domain/params/send_message_params.dart';
import '../../models/conversation_model.dart';

abstract class ConversationsRemoteDataSource {
  Future<void> sendMessage(SendMessageParams sendMessageParams);
  Stream<List<ConversationModel>> getConversations();
}
