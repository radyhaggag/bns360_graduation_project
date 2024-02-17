import '../../../../core/helpers/execute_and_handle_error.dart';
import '../../../../core/utils/custom_types.dart';
import '../../domain/entities/conversation_entity.dart';
import '../../domain/params/send_message_params.dart';
import '../../domain/repositories/conversations_repo.dart';
import '../datasources/remote/conversations_remote_data_source.dart';

class ConversationsRepoImpl implements ConversationsRepo {
  final ConversationsRemoteDataSource conversationsRemoteDataSource;

  ConversationsRepoImpl(this.conversationsRemoteDataSource);

  @override
  FutureEither<void> sendMessage(SendMessageParams sendMessageParams) async {
    return executeAndHandleErrorAsync(() {
      return conversationsRemoteDataSource.sendMessage(sendMessageParams);
    });
  }

  @override
  ResultOrFailure<Stream<List<ConversationEntity>>> getConversations() {
    return executeAndHandleError(() {
      return conversationsRemoteDataSource.getConversations();
    });
  }
}
