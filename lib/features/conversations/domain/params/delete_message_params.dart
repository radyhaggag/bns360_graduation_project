import 'package:equatable/equatable.dart';

import '../../../../core/helpers/chat_params_helper.dart';

class DeleteMessageParams extends Equatable {
  final String messageId;
  final String otherParticipantId;
  final int otherParticipantType;

  const DeleteMessageParams({
    required this.messageId,
    required this.otherParticipantId,
    required this.otherParticipantType,
  });

  @override
  List<Object> get props => [messageId];

  String get conversationId {
    return ChatParamsHelper.conversationId(
      otherId: otherParticipantId,
      otherUserType: otherParticipantType,
    );
  }
}
