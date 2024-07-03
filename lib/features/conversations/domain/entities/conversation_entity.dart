// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bns360_graduation_project/core/utils/extensions/iterable.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/shared_data/entities/participant_entity.dart';
import 'message_entity.dart';
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

  ConversationEntity copyWith({
    String? id,
    List<ParticipantEntity>? participants,
    List<String>? participantIds,
    MessageEntity? lastMessage,
    List<UnreadCountEntity>? unreadCount,
  }) {
    return ConversationEntity(
      id: id ?? this.id,
      participants: participants ?? this.participants,
      participantIds: participantIds ?? this.participantIds,
      lastMessage: lastMessage ?? this.lastMessage,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }

  ParticipantEntity? otherParticipant(ParticipantEntity currentParticipant) {
    final currentUserId = currentParticipant.modifiedId;
    return participants.firstWhereOrNull(
      (participant) => participant.modifiedId != currentUserId,
    );
  }

  int currentUserUnreadCount(ParticipantEntity currentParticipant) {
    final currentUserId = currentParticipant.modifiedId;
    final unread = unreadCount.firstWhereOrNull(
      (participant) => participant.userId == currentUserId,
    );
    return unread?.count ?? 0;
  }
}
