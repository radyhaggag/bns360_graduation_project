import '../../../domain/params/send_message_params.dart';

abstract class ConversationsRemoteDataSource {
  Future<void> sendMessage(SendMessageParams sendMessageParams);
}
