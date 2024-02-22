import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../../../core/shared_data/entities/participant_entity.dart';
import '../../../../core/utils/enums/message_type.dart';
import '../entities/unread_count_entity.dart';

class SendMessageParams extends Equatable {
  final String? content;
  final ParticipantEntity otherParticipant;
  final bool isFirstMsg;
  final List<UnreadCountEntity>? unreadCountEntity;
  final File? pickedFile;

  const SendMessageParams({
    required this.otherParticipant,
    required this.isFirstMsg,
    this.content,
    this.pickedFile,
    this.unreadCountEntity,
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
    if (content != null && pickedFile != null) {
      return MessageType.textAndImage;
    } else if (content != null) {
      return MessageType.text;
    } else {
      return MessageType.image;
    }
  }

  SendMessageParams copyWith({
    String? content,
    ParticipantEntity? otherParticipant,
    bool? isFirstMsg,
    List<UnreadCountEntity>? unreadCountEntity,
    File? pickedFile,
  }) {
    return SendMessageParams(
      content: content ?? this.content,
      otherParticipant: otherParticipant ?? this.otherParticipant,
      isFirstMsg: isFirstMsg ?? this.isFirstMsg,
      unreadCountEntity: unreadCountEntity ?? this.unreadCountEntity,
      pickedFile: pickedFile ?? this.pickedFile,
    );
  }
}
