import 'package:equatable/equatable.dart';

class DeleteMessageParams extends Equatable {
  final String messageId;
  final String conversationId;
  final String otherParticipantId;
  final int otherParticipantType;

  const DeleteMessageParams({
    required this.messageId,
    required this.otherParticipantId,
    required this.otherParticipantType,
    required this.conversationId,
  });

  @override
  List<Object> get props => [messageId];
}
