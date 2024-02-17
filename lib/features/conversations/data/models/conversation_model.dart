import '../../domain/entities/conversation_entity.dart';
import 'message_model.dart';
import 'participant_model.dart';
import 'unread_count_model.dart';

class ConversationModel extends ConversationEntity {
  const ConversationModel({
    required super.id,
    required super.participants,
    required super.lastMessage,
    required super.unreadCount,
  });

  static ConversationModel fromMap(Map<String, dynamic> map) {
    return ConversationModel(
      id: map['id'] as String,
      participants: (map['participants'] as List<dynamic>)
          .map((e) => ParticipantModel.fromMap(e as Map<String, dynamic>))
          .toList(),
      lastMessage: MessageModel.fromMap(map['lastMessage']),
      unreadCount: (map['unreadCount'] as List<dynamic>)
          .map((e) => UnreadCountModel.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'participants': participants,
      'lastMessage': lastMessage,
      'unreadCount': unreadCount.map((e) => e.toMap()).toList(),
    };
  }
}
