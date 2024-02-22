import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/message_entity.dart';
import 'message_content_widget.dart';
import 'message_date_widget.dart';

class ChatMessageItem extends StatelessWidget {
  const ChatMessageItem({
    super.key,
    required this.message,
    this.nextMessage,
  });

  final MessageEntity message;
  final MessageEntity? nextMessage;

  @override
  Widget build(BuildContext context) {
    final isFromMe = message.isFromMe;
    final mainAxisAlignment =
        isFromMe ? MainAxisAlignment.end : MainAxisAlignment.start;
    return Container(
      margin: margin,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: isFromMe
                ? [
                    // reorder this to make the date behind
                    MessageDateWidget(date: message.date),
                    Container(
                      margin: EdgeInsetsDirectional.only(
                        start: isFromMe ? 8.w : 0.w,
                        end: isFromMe ? 0.w : 8.w,
                      ),
                      child: MessageContentWidget(
                        message: message,
                      ),
                    ),
                  ]
                : [
                    Container(
                      margin: EdgeInsetsDirectional.only(
                        start: isFromMe ? 8.w : 0.w,
                        end: isFromMe ? 0.w : 8.w,
                      ),
                      child: MessageContentWidget(
                        message: message,
                      ),
                    ),
                    MessageDateWidget(date: message.date),
                  ],
          ),
        ],
      ),
    );
  }

  EdgeInsets get margin {
    bool isSameUser = message.isFromMe == (nextMessage?.isFromMe ?? false);
    if (isSameUser) {
      return EdgeInsets.only(top: 10.h);
    } else {
      return EdgeInsets.only(top: 20.h);
    }
  }
}
