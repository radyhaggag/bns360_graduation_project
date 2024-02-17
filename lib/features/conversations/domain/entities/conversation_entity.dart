import 'package:equatable/equatable.dart';

import 'message_entity.dart';
import 'participant_entity.dart';
import 'unread_count_entity.dart';

class ConversationEntity extends Equatable {
  final String id;
  final List<ParticipantEntity> participants;
  final List<String> participantIds;
  final MessageEntity lastMessage;
  final List<UnreadCountEntity> unreadCount;

  const ConversationEntity({
    required this.id,
    required this.participants,
    required this.participantIds,
    required this.lastMessage,
    required this.unreadCount,
  });

  @override
  List<Object?> get props => [
        id,
        participants,
        participantIds,
        unreadCount,
        lastMessage,
      ];
}
