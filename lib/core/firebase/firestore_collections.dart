import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CollectionNames {
  static const chats = 'chats';
}

abstract class FirebaseCollections {
  static final _firestore = FirebaseFirestore.instance;
  static final chats = _firestore.collection(CollectionNames.chats);

  static DocumentReference messageDoc(String chatId) {
    return chats.doc(chatId);
  }
}
