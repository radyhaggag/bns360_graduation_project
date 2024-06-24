import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../../../core/shared_data/entities/participant_entity.dart';
import '../../../../core/utils/enums/message_type.dart';

class SendMessageParams extends Equatable {
  final String? content;
  final ParticipantEntity otherParticipant;
  final bool isFirstMsg;
  final File? pickedFile;
  final String conversationId;

  const SendMessageParams({
    required this.otherParticipant,
    required this.isFirstMsg,
    this.content,
    this.pickedFile,
    required this.conversationId,
  });

  @override
  List<Object?> get props => [
        content,
        messageType,
        otherParticipant,
        pickedFile,
        isFirstMsg,
      ];

  MessageType get messageType {
    if ((content ?? "").isNotEmpty && pickedFile != null) {
      return MessageType.textAndImage;
    } else if ((content ?? "").isNotEmpty) {
      return MessageType.text;
    } else {
      return MessageType.image;
    }
  }

  SendMessageParams copyWith({
    String? content,
    ParticipantEntity? otherParticipant,
    bool? isFirstMsg,
    File? pickedFile,
    String? conversationId,
  }) {
    return SendMessageParams(
      content: content ?? this.content,
      otherParticipant: otherParticipant ?? this.otherParticipant,
      isFirstMsg: isFirstMsg ?? this.isFirstMsg,
      pickedFile: pickedFile ?? this.pickedFile,
      conversationId: conversationId ?? this.conversationId,
    );
  }
}
