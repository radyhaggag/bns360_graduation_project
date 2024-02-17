import '../../../../core/utils/custom_types.dart';
import '../params/send_message_params.dart';

abstract class ConversationsRepo {
  FutureEither<void> sendMessage(SendMessageParams sendMessageParams);
}
