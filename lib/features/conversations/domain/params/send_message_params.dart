import 'package:bns360_graduation_project/features/conversations/domain/entities/unread_count_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/shared_data/entities/participant_entity.dart';
import '../../../../core/utils/enums/message_type.dart';

class SendMessageParams extends Equatable {
  final String content;
  final MessageType messageType;
  final ParticipantEntity otherParticipant;
  final bool isFirstMsg;
  final List<UnreadCountEntity>? unreadCountEntity;

  const SendMessageParams({
    required this.content,
    required this.messageType,
    required this.otherParticipant,
    required this.isFirstMsg,
    this.unreadCountEntity,
  });

  @override
  List<Object?> get props => [
        content,
        messageType,
        otherParticipant,
        isFirstMsg,
      ];
}
