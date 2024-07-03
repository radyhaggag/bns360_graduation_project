import 'package:equatable/equatable.dart';

class ResetUnreadCountParams extends Equatable {
  final String otherParticipantId;
  final int otherParticipantType;
  final int numOfMessages;
  final String currentUserId;
  final int currentParticipantType;
  final String conversationId;

  const ResetUnreadCountParams({
    required this.otherParticipantId,
    required this.numOfMessages,
    required this.otherParticipantType,
    required this.currentUserId,
    required this.currentParticipantType,
    required this.conversationId,
  });

  @override
  List<Object> get props => [
        otherParticipantId,
        numOfMessages,
        otherParticipantType,
        currentUserId,
      ];
}
