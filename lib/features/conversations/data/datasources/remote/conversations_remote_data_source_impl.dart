import 'package:bns360_graduation_project/core/firebase/firestore_manager.dart';
import 'package:bns360_graduation_project/features/conversations/data/models/conversation_model.dart';
import 'package:bns360_graduation_project/features/conversations/data/models/message_model.dart';
import 'package:bns360_graduation_project/features/conversations/data/models/participant_model.dart';
import 'package:bns360_graduation_project/features/conversations/data/models/unread_count_model.dart';
import 'package:bns360_graduation_project/features/conversations/domain/entities/participant_entity.dart';
import 'package:bns360_graduation_project/features/conversations/domain/params/send_message_params.dart';

import '../../../../../core/firebase/firestore_collections.dart';
import 'conversations_remote_data_source.dart';

class ConversationsRemoteDataSourceImpl
    implements ConversationsRemoteDataSource {
  final currentParticipant = ParticipantModel.currentParticipant();

  @override
  Future<void> sendMessage(SendMessageParams sendMessageParams) async {
    final message = MessageModel(
      senderId: currentParticipant.id,
      type: sendMessageParams.messageType,
      content: sendMessageParams.content,
      date: DateTime.now(),
    );

    String? conversationId = sendMessageParams.conversationId;

    conversationId ??= await _createConversation(
      message,
      sendMessageParams.otherParticipant,
    );

    final ref = FirestoreCollections.messages(conversationId);

    await FirestoreManager.addDoc(
      reference: ref,
      data: message.toMap(),
    );
  }

  Future<String> _createConversation(
    MessageModel message,
    ParticipantEntity otherParticipant,
  ) async {
    final conversationId = FirestoreCollections.conversations.doc().id;

    final conversation = ConversationModel(
      id: conversationId,
      participants: [currentParticipant, otherParticipant],
      lastMessage: message,
      unreadCount: [
        UnreadCountModel(userId: currentParticipant.id, count: 0),
        UnreadCountModel(userId: otherParticipant.id, count: 1),
      ],
    );

    await FirestoreCollections.conversationDoc(conversationId).set(
      conversation.toMap(),
    );

    return conversationId;
  }
}
