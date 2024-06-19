import 'package:bns360_graduation_project/core/api/api_consumer.dart';

import '../../../../core/firebase/firestore_collections.dart';
import '../../../../core/firebase/firestore_manager.dart';
import '../../../../core/providers/app_provider.dart';
import '../../../../core/utils/enums/message_type.dart';
import '../../../conversations/data/models/message_model.dart';

abstract class ChatbotDataSource {
  Future<void> sendMessage(String message);
  Stream<List<MessageModel>> getConversationMessages();
}

class ChatbotDataSourceImpl implements ChatbotDataSource {
  String get currentUserId => AppProvider().getProfile()!.id;
  String get chatbotAPI => "http://10.0.2.2:5000/predict_route";

  final APIConsumer apiConsumer;

  ChatbotDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<String?> sendMessage(
    String message,
  ) async {
    final res = await apiConsumer.post(
      endpoint: chatbotAPI,
      data: {
        "user_input": message,
      },
    );

    final response = res.data["response"];

    final conversationId = "${AppProvider().getProfile()!.id}_chatbot";

    final myMessageModel = MessageModel(
      senderId: currentUserId,
      type: MessageType.text,
      content: message,
      date: DateTime.now(),
    );

    final botMessageModel = MessageModel(
      senderId: "chatbot",
      type: MessageType.text,
      content: response,
      date: DateTime.now(),
    );

    final ref = FirestoreCollections.chatbotMessages(conversationId);

    final batch = FirestoreManager.db.batch();

    batch.set(
      ref.doc(),
      myMessageModel.toMap(),
    );

    batch.set(
      ref.doc(),
      botMessageModel.toMap(),
    );

    await batch.commit();

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
