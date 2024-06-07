import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions/context.dart';
import '../../../conversations/domain/entities/message_entity.dart';
import '../../../conversations/presentation/widgets/messages/message_content_widget.dart';
import '../../../conversations/presentation/widgets/messages/message_date_widget.dart';
import '../../../conversations/presentation/widgets/messages/message_text_template.dart';

class ChatbotMessageItem extends StatelessWidget {
  const ChatbotMessageItem({
    super.key,
    required this.message,
  });

  final MessageEntity message;

  @override
  Widget build(BuildContext context) {
    final isFromMe = message.isFromMe;
    final mainAxisAlignment =
        isFromMe ? MainAxisAlignment.end : MainAxisAlignment.start;
    return InkWell(
      highlightColor: context.theme.listTileTheme.tileColor,
      splashColor: context.theme.listTileTheme.tileColor,
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
                    child: MessageTextTemplate(
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
}
