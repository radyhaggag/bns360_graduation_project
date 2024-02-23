import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_data/entities/participant_entity.dart';
import '../../../domain/entities/message_entity.dart';
import '../../../domain/params/delete_message_params.dart';
import '../../bloc/conversations_bloc.dart';
import 'confirm_delete_message_pop_up.dart';
import 'message_content_widget.dart';
import 'message_date_widget.dart';

class ChatMessageItem extends StatelessWidget {
  const ChatMessageItem({
    super.key,
    required this.message,
    required this.otherParticipant,
  });

  final MessageEntity message;
  final ParticipantEntity otherParticipant;

  @override
  Widget build(BuildContext context) {
    final isFromMe = message.isFromMe;
    final mainAxisAlignment =
        isFromMe ? MainAxisAlignment.end : MainAxisAlignment.start;
    return InkWell(
      highlightColor: Theme.of(context).listTileTheme.tileColor,
      splashColor: Theme.of(context).listTileTheme.tileColor,
      onLongPress: !message.isDeleted
          ? () {
              if (!isFromMe) return;
              ConfirmationDialog.show(
                context,
                onConfirm: () {
                  context.read<ConversationsBloc>().add(DeleteMessageEvent(
                        deleteMessageParams: deleteMessageParams,
                      ));
                  Navigator.of(context).pop();
                },
              );
            }
          : null,
      child: Container(
        margin: EdgeInsets.only(top: 5.h),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (isFromMe) ...[
                  Container(
                    margin: EdgeInsetsDirectional.only(
                      start: isFromMe ? 8.w : 0.w,
                      end: isFromMe ? 0.w : 8.w,
                      bottom: 5,
                    ),
                    child: MessageContentWidget(
                      message: message,
                    ),
                  ),
                  MessageDateWidget(date: message.date),
                ] else ...[
                  Container(
                    margin: EdgeInsetsDirectional.only(
                      start: isFromMe ? 8.w : 0.w,
                      end: isFromMe ? 0.w : 8.w,
                      bottom: 5,
                    ),
                    child: MessageContentWidget(
                      message: message,
                    ),
                  ),
                  MessageDateWidget(date: message.date),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  DeleteMessageParams get deleteMessageParams {
    return DeleteMessageParams(
      messageId: message.id!,
      otherParticipantId: otherParticipant.id,
      otherParticipantType: otherParticipant.userType,
    );
  }
}
