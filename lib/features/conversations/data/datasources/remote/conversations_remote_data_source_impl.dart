import 'package:bns360_graduation_project/core/firebase/firestore_manager.dart';
import 'package:bns360_graduation_project/features/conversations/data/models/conversation_model.dart';
import 'package:bns360_graduation_project/features/conversations/data/models/message_model.dart';
import 'package:bns360_graduation_project/core/shared_data/models/participant_model.dart';
import 'package:bns360_graduation_project/features/conversations/data/models/unread_count_model.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/participant_entity.dart';
import 'package:bns360_graduation_project/features/conversations/domain/entities/conversation_entity.dart';
import 'package:bns360_graduation_project/features/conversations/domain/params/send_message_params.dart';

import '../../../../../core/firebase/firestore_collections.dart';
import '../../../domain/entities/unread_count_entity.dart';
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
      participantIds: [currentParticipant.id, otherParticipant.id],
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

  @override
  Stream<List<ConversationModel>> getConversations() {
    final currentUserId = ParticipantModel.currentParticipant().id;
    final snapshots = FirestoreCollections.conversations
        .where('participantIds', arrayContains: currentUserId)
        .snapshots();

    return snapshots.map((event) {
      final conversations = event.docs.map((e) {
        final data = e.data() as Map<String, dynamic>;
        final conversation = ConversationModel.fromMap(data);
        return conversation;
      }).toList();
      return conversations;
    });
  }

  @override
  Future<Stream<List<MessageModel>>> getConversationMessages(
    ConversationEntity conversationEntity,
  ) async {
    final ref = FirestoreCollections.messages(conversationEntity.id);
    final query = ref.orderBy('date', descending: true);

    updateUnreadIfRequired(
      conversationEntity.unreadCount,
      conversationEntity.id,
    );

    return query.snapshots().map((event) {
      final messages = event.docs.map((e) {
        final data = e.data() as Map<String, dynamic>;
        final message = MessageModel.fromMap(data);
        return message;
      }).toList();
      return messages;
    });
  }

  @override
  Future<ConversationModel?> checkIfConversationExist(
    String otherParticipantId,
  ) async {
    final conversation = await _getConversation(otherParticipantId);
    return conversation;
  }

  Future<ConversationModel?> _getConversation(
    String otherParticipantId,
  ) async {
    final currentUserId = ParticipantModel.currentParticipant().id;
    final collection = await FirestoreCollections.conversations.where(
      'participantIds',
      arrayContains: [
        currentUserId,
        otherParticipantId,
      ],
    ).get();

    if (collection.docs.isEmpty) {
      return null;
    } else {
      final data = collection.docs.first.data() as Map<String, dynamic>;
      final conversation = ConversationModel.fromMap(data);
      return conversation;
    }
  }

  Future<void> updateUnreadIfRequired(
    List<UnreadCountEntity> unreadCounts,
    String conversationId,
  ) async {
    final currentUserId = ParticipantModel.currentParticipant().id;

    final index = unreadCounts.indexWhere(
      (model) => model.userId == currentUserId,
    );

    final currentCount = unreadCounts[index].count;

    if (currentCount > 0) {
      unreadCounts[index] = unreadCounts[index].copyWith(0);

      final doc = FirestoreCollections.conversationDoc(conversationId);

      await doc.update({
        'unreadCount': unreadCounts.map((e) => e.toMap()).toList(),
      });
    }
  }
}
