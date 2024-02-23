import '../../../../core/helpers/execute_and_handle_error.dart';
import '../../../../core/utils/custom_types.dart';
import '../../domain/entities/conversation_entity.dart';
import '../../domain/entities/message_entity.dart';
import '../../domain/params/reset_unread_count_params.dart';
import '../../domain/params/send_message_params.dart';
import '../../domain/repositories/conversations_repo.dart';
import '../datasources/remote/conversations_remote_data_source.dart';

class ConversationsRepoImpl implements ConversationsRepo {
  final ConversationsRemoteDataSource conversationsRemoteDataSource;

  ConversationsRepoImpl(this.conversationsRemoteDataSource);

  @override
  FutureEither<String?> sendMessage(SendMessageParams sendMessageParams) async {
    return executeAndHandleErrorAsync<String?>(() {
      return conversationsRemoteDataSource.sendMessage(sendMessageParams);
    });
  }

  @override
  ResultOrFailure<Stream<List<ConversationEntity>>> getConversations() {
    return executeAndHandleError(() {
      return conversationsRemoteDataSource.getConversations();
    });
  }

  @override
  FutureEither<ConversationEntity?> checkIfConversationExist(
    String otherParticipantId,
  ) {
    return executeAndHandleErrorAsync<ConversationEntity?>(() {
      return conversationsRemoteDataSource.checkIfConversationExist(
        otherParticipantId,
      );
    });
  }

  @override
  FutureEither<Stream<List<MessageEntity>>> getConversationMessages(
    String conversationId,
  ) {
    return executeAndHandleErrorAsync(() {
      return conversationsRemoteDataSource.getConversationMessages(
        conversationId,
      );
    });
  }

  @override
  FutureEither<void> resetUnreadCountForCurrentUser(
    ResetUnreadCountParams resetUnreadCountParams,
  ) async {
    return executeAndHandleErrorAsync(() {
      return conversationsRemoteDataSource.resetUnreadCountForCurrentUser(
        resetUnreadCountParams,
      );
    });
  }
}
