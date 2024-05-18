import 'package:equatable/equatable.dart';

import '../../../../core/providers/app_provider.dart';
import '../../../../core/utils/enums/message_type.dart';

class MessageEntity extends Equatable {
  final String? id;
  final String senderId;
  final MessageType type;
  final String? content;
  final DateTime date;
  final String? imageUrl;
  final bool isDeleted;

  const MessageEntity({
    required this.senderId,
    required this.type,
    required this.date,
    this.id,
    this.content,
    this.imageUrl,
    this.isDeleted = false,
  });

  bool get isFromMe {
    final currentUserId = AppProvider().getProfile()!.id;
    return currentUserId == senderId;
  }

  @override
  List<Object?> get props => [id, senderId, type, content, date];
}
