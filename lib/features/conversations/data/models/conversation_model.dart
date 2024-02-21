import 'package:bns360_graduation_project/core/shared_data/entities/participant_entity.dart';
import 'package:bns360_graduation_project/features/conversations/domain/entities/message_entity.dart';
import 'package:bns360_graduation_project/features/conversations/domain/entities/unread_count_entity.dart';

import '../../../../core/shared_data/models/participant_model.dart';
import '../../domain/entities/conversation_entity.dart';
import 'message_model.dart';
import 'unread_count_model.dart';

class ConversationModel extends ConversationEntity {
  const ConversationModel({
    required super.id,
    required super.participantIds,
    required super.participants,
    required super.lastMessage,
    required super.unreadCount,
  });

  static ConversationModel fromMap(Map<String, dynamic> map) {
    return ConversationModel(
      id: map['id'] as String,
      participantIds: List<String>.from(map['participantIds']),
      participants: List<ParticipantModel>.from(map['participants']
          .map((e) => ParticipantModel.fromMap(e as Map<String, dynamic>))),
      lastMessage: MessageModel.fromMap(map['lastMessage']),
      unreadCount: List<UnreadCountModel>.from(map['unreadCount']
          .map((e) => UnreadCountModel.fromMap(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'participantIds': participantIds,
      'participants': participants.map((e) => e.toMap()),
      'lastMessage': lastMessage.toMap(),
      'unreadCount': unreadCount.map((e) => e.toMap()).toList(),
    };
  }

  Map<String, dynamic> updateToMap() {
    return {
      'id': id,
      'lastMessage': lastMessage.toMap(),
      'unreadCount': unreadCount.map((e) => e.toMap()).toList(),
    };
  }

  @override
  ConversationModel copyWith({
    String? id,
    List<ParticipantEntity>? participants,
    List<String>? participantIds,
    MessageEntity? lastMessage,
    List<UnreadCountEntity>? unreadCount,
  }) {
    return ConversationModel(
      id: id ?? this.id,
      participants: participants ?? this.participants,
      participantIds: participantIds ?? this.participantIds,
      lastMessage: lastMessage ?? this.lastMessage,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }
}
