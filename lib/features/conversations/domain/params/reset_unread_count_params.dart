import 'package:equatable/equatable.dart';

class ResetUnreadCountParams extends Equatable {
  final String otherParticipantId;
  final int otherParticipantType;
  final int numOfMessages;

  const ResetUnreadCountParams({
    required this.otherParticipantId,
    required this.numOfMessages,
    required this.otherParticipantType,
  });

  @override
  List<Object> get props => [
        otherParticipantId,
        numOfMessages,
        otherParticipantType,
      ];
}
