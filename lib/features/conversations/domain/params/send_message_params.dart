import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums/message_type.dart';
import '../../../../core/shared_data/entities/participant_entity.dart';

class SendMessageParams extends Equatable {
  final String? conversationId;
  final String content;
  final MessageType messageType;
  final ParticipantEntity otherParticipant;

  const SendMessageParams({
    required this.conversationId,
    required this.content,
    required this.messageType,
    required this.otherParticipant,
  });

  @override
  List<Object?> get props => [
        conversationId,
        content,
        messageType,
        otherParticipant,
      ];
}
