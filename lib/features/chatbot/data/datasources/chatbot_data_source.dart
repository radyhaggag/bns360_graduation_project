import 'package:bns360_graduation_project/core/providers/app_provider.dart';
import 'package:bns360_graduation_project/features/conversations/data/models/message_model.dart';

import '../../../../core/firebase/firestore_collections.dart';
import '../../../../core/firebase/firestore_manager.dart';
import '../../../../core/utils/enums/message_type.dart';

abstract class ChatbotDataSource {
  Future<void> sendMessage(String message);
  Stream<List<MessageModel>> getConversationMessages();
}

class ChatbotDataSourceImpl implements ChatbotDataSource {
  String get currentUserId => AppProvider().getProfile()!.id;

  @override
  Future<String?> sendMessage(
    String message,
  ) async {
    final conversationId = "${AppProvider().getProfile()!.id}_chatbot";

    final model = MessageModel(
      senderId: currentUserId,
      type: MessageType.text,
      content: message,
      date: DateTime.now(),
    );

    final ref = FirestoreCollections.chatbotMessages(conversationId);

    await FirestoreManager.addDoc(
      reference: ref,
      data: model.toMap(),
    );

    return conversationId;
  }

  @override
  Stream<List<MessageModel>> getConversationMessages() {
    final conversationId = "${AppProvider().getProfile()!.id}_chatbot";
    final ref = FirestoreCollections.chatbotMessages(conversationId);
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
}
