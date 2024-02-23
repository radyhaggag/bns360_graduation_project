import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/enums/message_type.dart';
import '../../../domain/entities/message_entity.dart';
import '../../bloc/conversations_bloc.dart';
import 'message_image_template.dart';
import 'message_text_template.dart';

class MessageContentWidget extends StatelessWidget {
  const MessageContentWidget({
    super.key,
    required this.message,
  });

  final MessageEntity message;

  @override
  Widget build(BuildContext context) {
    // final bloc = context.read<ConversationsBloc>();

    return BlocBuilder<ConversationsBloc, ConversationsState>(
      builder: (context, state) {
        bool isTextMessage = message.type == MessageType.text;
        if (message.isDeleted) {
          return MessageTextTemplate(message: message);
        } else if (isTextMessage) {
          return MessageTextTemplate(message: message);
        } else if (message.type == MessageType.image) {
          return MessageImageTemplate(imageUrl: message.imageUrl!);
        } else {
          return MessageImageWithTextTemplate(message: message);
        }
      },
    );
  }
}
