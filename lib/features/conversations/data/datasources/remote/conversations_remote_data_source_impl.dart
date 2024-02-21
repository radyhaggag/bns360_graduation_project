import 'package:bns360_graduation_project/core/firebase/firestore_manager.dart';
import 'package:bns360_graduation_project/core/helpers/chat_params_helper.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/participant_entity.dart';
import 'package:bns360_graduation_project/core/shared_data/models/participant_model.dart';
import 'package:bns360_graduation_project/features/conversations/data/models/conversation_model.dart';
import 'package:bns360_graduation_project/features/conversations/data/models/message_model.dart';
import 'package:bns360_graduation_project/features/conversations/data/models/unread_count_model.dart';
import 'package:bns360_graduation_project/features/conversations/domain/params/send_message_params.dart';

import '../../../../../core/firebase/firestore_collections.dart';
import '../../../domain/entities/unread_count_entity.dart';
import 'conversations_remote_data_source.dart';

class ConversationsRemoteDataSourceImpl
    implements ConversationsRemoteDataSource {
  final currentParticipant = ParticipantModel.currentParticipant();
  final currentUserId = ParticipantModel.currentParticipant().id;

  @override
  Future<String?> sendMessage(
    SendMessageParams sendMessageParams,
  ) async {
    final message = MessageModel(
      senderId: currentParticipant.id,
      type: sendMessageParams.messageType,
      content: sendMessageParams.content,
      date: DateTime.now(),
    );

    String conversationId = ChatParamsHelper.conversationId(
      otherId: sendMessageParams.otherParticipant.id,
      otherUserType: sendMessageParams.otherParticipant.userType,
    );

    final ref = FirestoreCollections.messages(conversationId);

    if (sendMessageParams.isFirstMsg) {
      await _createConversation(
        message,
        sendMessageParams.otherParticipant,
      );
    }

    await FirestoreManager.addDoc(
      reference: ref,
      data: message.toMap(),
    );

    if (!sendMessageParams.isFirstMsg) {
      final doc =
          await FirestoreCollections.conversationDoc(conversationId).get();
      ConversationModel conversation = ConversationModel.fromMap(
        doc.data()! as Map<String, dynamic>,
      );
      final currentUnreadCount = _currentUnread(conversation.unreadCount);
      final otherUnreadCount = _otherUnread(conversation.unreadCount);
      conversation = conversation.copyWith(
        lastMessage: message,
        unreadCount: [
          currentUnreadCount,
          otherUnreadCount.copyWith(otherUnreadCount.count + 1),
        ],
      );
      await FirestoreManager.updateDoc(
        reference: FirestoreCollections.conversations,
        data: conversation.updateToMap(),
        docPath: conversation.id,
      );
    }

    return conversationId;
  }

  Future<ConversationModel> _createConversation(
    MessageModel message,
    ParticipantEntity otherParticipant,
  ) async {
    final participantIds = [currentParticipant.id, otherParticipant.id];
    final model = await checkIfConversationExist(otherParticipant.id);

    if (model != null) return model;

    String conversationId = ChatParamsHelper.conversationId(
      otherId: otherParticipant.id,
      otherUserType: otherParticipant.userType,
    );

    final conversation = ConversationModel(
      id: conversationId,
      participantIds: participantIds,
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

    return conversation;
  }

  @override
  Stream<List<ConversationModel>> getConversations() {
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
    String conversationId,
  ) async {
    final ref = FirestoreCollections.messages(conversationId);
    final query = ref.orderBy('date', descending: true);

    // updateUnreadIfRequired(
    //   conversationEntity.unreadCount,
    //   conversationEntity.id,
    // );

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

  Future<void> _updateUnreadCount(
    List<UnreadCountEntity> unreadCounts,
    String conversationId,
    int currentCount,
    int otherCount,
  ) async {
    final currentIdx = unreadCounts.indexWhere(
      (model) => model.userId == currentUserId,
    );
    final otherIdx = currentIdx == 0 ? 1 : 0;

    unreadCounts[currentIdx] = unreadCounts[currentIdx].copyWith(currentCount);
    unreadCounts[otherIdx] = unreadCounts[otherIdx].copyWith(otherCount);

    final doc = FirestoreCollections.conversationDoc(conversationId);

    await doc.update({
      'unreadCount': unreadCounts.map((e) => e.toMap()).toList(),
    });
  }

  UnreadCountEntity _currentUnread(List<UnreadCountEntity> unreadCounts) {
    final data = unreadCounts.firstWhere(
      (model) => model.userId == currentUserId,
    );
    return data;
  }

  UnreadCountEntity _otherUnread(List<UnreadCountEntity> unreadCounts) {
    final data = unreadCounts.firstWhere(
      (model) => model.userId != currentUserId,
    );
    return data;
  }
}
