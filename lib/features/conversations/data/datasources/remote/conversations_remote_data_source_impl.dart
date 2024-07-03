import '../../../../../core/firebase/firebase_storage_manager.dart';
import '../../../../../core/firebase/firestore_collections.dart';
import '../../../../../core/firebase/firestore_manager.dart';
import '../../../../../core/helpers/chat_params_helper.dart';
import '../../../../../core/shared_data/entities/participant_entity.dart';
import '../../../domain/entities/message_entity.dart';
import '../../../domain/entities/unread_count_entity.dart';
import '../../../domain/params/delete_message_params.dart';
import '../../../domain/params/reset_unread_count_params.dart';
import '../../../domain/params/send_message_params.dart';
import '../../models/conversation_model.dart';
import '../../models/message_model.dart';
import '../../models/unread_count_model.dart';
import 'conversations_remote_data_source.dart';

class ConversationsRemoteDataSourceImpl
    implements ConversationsRemoteDataSource {
  @override
  Future<String?> sendMessage(
    SendMessageParams sendMessageParams,
  ) async {
    String conversationId = sendMessageParams.conversationId;

    final file = sendMessageParams.pickedFile;
    String? imageUrl;
    if (file != null) {
      final ref =
          FirebaseStorageReferences.conversationReference(conversationId);
      imageUrl = await FirebaseStorageManager.uploadFile(
        file: file,
        ref: ref,
      );
    }

    final message = MessageModel(
      senderId: sendMessageParams.currentParticipant.modifiedId,
      type: sendMessageParams.messageType,
      content: sendMessageParams.content,
      imageUrl: imageUrl,
      date: DateTime.now(),
    );

    final ref = FirestoreCollections.messages(conversationId);

    if (sendMessageParams.isFirstMsg) {
      await _createConversation(
        message,
        sendMessageParams.otherParticipant,
        sendMessageParams.currentParticipant,
      );
    }

    await FirestoreManager.addDoc(
      reference: ref,
      data: message.toMap(),
    );

    if (!sendMessageParams.isFirstMsg) {
      await _updateUnreadCount(
        message,
        conversationId,
        sendMessageParams.currentParticipant.modifiedId,
      );
    }

    return conversationId;
  }

  Future<ConversationModel> _createConversation(
    MessageModel message,
    ParticipantEntity otherParticipant,
    ParticipantEntity currentParticipant,
  ) async {
    final participantIds = [
      currentParticipant.modifiedId,
      otherParticipant.modifiedId
    ];
    final model = await checkIfConversationExist(otherParticipant.modifiedId);

    if (model != null) return model;

    String conversationId = ChatParamsHelper.conversationId(
      otherId: otherParticipant.modifiedId,
      otherUserType: otherParticipant.userType,
      currentUserId: currentParticipant.modifiedId,
      currentUserType: currentParticipant.userType,
    );

    final conversation = ConversationModel(
      id: conversationId,
      participantIds: participantIds,
      participants: [currentParticipant, otherParticipant],
      lastMessage: message,
      unreadCount: [
        UnreadCountModel(userId: currentParticipant.modifiedId, count: 0),
        UnreadCountModel(userId: otherParticipant.modifiedId, count: 1),
      ],
    );

    await FirestoreCollections.conversationDoc(conversationId).set(
      conversation.toMap(),
    );

    return conversation;
  }

  @override
  Stream<List<ConversationModel>> getConversations(String currentUserId) {
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
    final query = ref.orderBy('date', descending: false);

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
    String conversationId,
  ) async {
    final conversation = await _getConversation(conversationId);
    return conversation;
  }

  Future<ConversationModel?> _getConversation(
    String conversationId,
  ) async {
    final doc =
        await FirestoreCollections.conversationDoc(conversationId).get();

    if (doc.data() == null) {
      return null;
    } else {
      final data = doc.data() as Map<String, dynamic>;
      final conversation = ConversationModel.fromMap(data);
      return conversation;
    }
  }

  @override
  Future<void> resetUnreadCountForCurrentUser(
    ResetUnreadCountParams resetUnreadCountParams,
  ) async {
    if (resetUnreadCountParams.numOfMessages == 0) return;
    String conversationId = resetUnreadCountParams.conversationId;

    final conversation = await _getConversation(
      conversationId,
    );
    if (conversation == null) return;
    final currentUnreadCount = _currentUnread(
      conversation.unreadCount,
      resetUnreadCountParams.currentUserId,
    );
    final otherUnreadCount = _otherUnread(
      conversation.unreadCount,
      resetUnreadCountParams.currentUserId,
    );

    final unreadCount = [
      currentUnreadCount.copyWith(0),
      otherUnreadCount,
    ];

    await FirestoreManager.updateDoc(
      reference: FirestoreCollections.conversations,
      data: {'unreadCount': unreadCount.map((e) => e.toMap()).toList()},
      docPath: conversation.id,
    );
  }

  Future<void> _updateUnreadCount(
    MessageEntity lastMessage,
    String conversationId,
    String currentUserId,
  ) async {
    final doc =
        await FirestoreCollections.conversationDoc(conversationId).get();
    ConversationModel conversation = ConversationModel.fromMap(
      doc.data()! as Map<String, dynamic>,
    );
    final currentUnreadCount = _currentUnread(
      conversation.unreadCount,
      currentUserId,
    );
    final otherUnreadCount = _otherUnread(
      conversation.unreadCount,
      currentUserId,
    );
    conversation = conversation.copyWith(
      lastMessage: lastMessage,
      unreadCount: [
        currentUnreadCount.copyWith(0),
        otherUnreadCount.copyWith(otherUnreadCount.count + 1),
      ],
    );
    await FirestoreManager.updateDoc(
      reference: FirestoreCollections.conversations,
      data: conversation.updateToMap(),
      docPath: conversation.id,
    );
  }

  UnreadCountEntity _currentUnread(
    List<UnreadCountEntity> unreadCounts,
    String currentUserId,
  ) {
    final data = unreadCounts.firstWhere(
      (model) => model.userId == currentUserId,
    );
    return data;
  }

  UnreadCountEntity _otherUnread(
    List<UnreadCountEntity> unreadCounts,
    String currentUserId,
  ) {
    final data = unreadCounts.firstWhere(
      (model) => model.userId != currentUserId,
    );
    return data;
  }

  @override
  Future<void> deleteMessage(DeleteMessageParams deleteMessageParams) async {
    final messagesRef = FirestoreCollections.messages(
      deleteMessageParams.conversationId,
    );

    await FirestoreManager.updateDoc(
      reference: messagesRef,
      docPath: deleteMessageParams.messageId,
      data: MessageModel.deleteMap(),
    );
  }
}
