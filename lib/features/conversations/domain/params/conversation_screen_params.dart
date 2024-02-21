import 'package:equatable/equatable.dart';

import '../../../../core/shared_data/entities/participant_entity.dart';

class ConversationScreenParams extends Equatable {
  final ParticipantEntity participantEntity;

  const ConversationScreenParams({
    required this.participantEntity,
  });

  @override
  List<Object?> get props => [participantEntity];
}
