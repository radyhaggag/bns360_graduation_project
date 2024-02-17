import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums/message_type.dart';

class MessageEntity extends Equatable {
  final String? id;
  final String senderId;
  final MessageType type;
  final String content;
  final DateTime date;

  const MessageEntity({
    this.id,
    required this.senderId,
    required this.type,
    required this.content,
    required this.date,
  });

  @override
  List<Object?> get props => [id, senderId, type, content, date];
}
