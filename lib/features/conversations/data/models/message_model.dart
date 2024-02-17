import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/utils/enums/message_type.dart';
import '../../domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  const MessageModel({
    super.id,
    required super.senderId,
    required super.type,
    required super.content,
    required super.date,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as String?,
      senderId: map['senderId'] as String,
      type: MessageType.fromTypeText(map['type'] as String),
      content: map['content'] as String,
      date: (map['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'type': type.value,
      'content': content,
      'date': Timestamp.fromDate(date),
    };
  }
}
