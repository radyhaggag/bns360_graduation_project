import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/utils/enums/message_type.dart';
import '../../domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  const MessageModel({
    required super.senderId,
    required super.type,
    required super.date,
    super.id,
    super.content,
    super.imageUrl,
    super.isDeleted,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as String?,
      senderId: map['senderId'] as String,
      type: MessageType.parse(map['type'] as int),
      content: map['content'] as String?,
      imageUrl: map['imageUrl'] as String?,
      date: (map['date'] as Timestamp).toDate(),
      isDeleted: (map['isDeleted'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'type': type.id,
      'content': content,
      'imageUrl': imageUrl,
      'date': Timestamp.fromDate(date),
    };
  }

  static Map<String, dynamic> deleteMap() {
    return {
      'isDeleted': true,
    };
  }
}

extension MessageEntityToMap on MessageEntity {
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'type': type.id,
      'content': content,
      'imageUrl': imageUrl,
      'date': Timestamp.fromDate(date),
    };
  }
}
