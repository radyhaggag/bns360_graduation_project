import 'package:equatable/equatable.dart';

import '../../../../core/shared_data/entities/participant_entity.dart';
import '../entities/conversation_entity.dart';

class ConversationScreenParams extends Equatable {
  final ParticipantEntity participantEntity;
  final ConversationEntity? conversation;

  const ConversationScreenParams({
    required this.participantEntity,
    this.conversation,
  });

  @override
  List<Object?> get props => [participantEntity, conversation];
}
