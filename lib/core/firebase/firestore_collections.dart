import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CollectionNames {
  static const conversations = 'conversations';
  static const messages = 'messages';
  static const chatbot = 'chatbot';
  static const chatbotMessages = 'chatbotMessages';
}

abstract class FirestoreCollections {
  static final _firestore = FirebaseFirestore.instance;

  static CollectionReference get conversations => _firestore.collection(
        CollectionNames.conversations,
      );

  static CollectionReference messages(String conversationId) {
    return conversations.doc(conversationId).collection(
          CollectionNames.messages,
        );
  }

  static DocumentReference conversationDoc(String conversationId) {
    return conversations.doc(conversationId);
  }

  static CollectionReference chatbotMessages(String conversationId) {
    return _firestore
        .collection(CollectionNames.chatbot)
        .doc(conversationId)
        .collection(CollectionNames.chatbotMessages);
  }
}
