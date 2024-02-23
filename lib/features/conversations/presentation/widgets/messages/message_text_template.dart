import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/message_entity.dart';

class MessageTextTemplate extends StatelessWidget {
  const MessageTextTemplate({
    super.key,
    required this.message,
    this.width,
    this.isUnderImage = true,
  });
  final MessageEntity message;
  final double? width;
  final bool isUnderImage;

  @override
  Widget build(BuildContext context) {
    final isFromMe = message.isFromMe;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 0.7.sw,
        minWidth: width ?? 0.0,
      ),
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color:
              isFromMe ? AppColors.primary : Theme.of(context).highlightColor,
          borderRadius: isUnderImage
              ? BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(10.r),
                  bottomStart: Radius.circular(10.r),
                  topEnd: Radius.circular(isFromMe ? 0.r : 10.r),
                  topStart: Radius.circular(isFromMe ? 10.r : 0.r),
                )
              : BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(10.r),
                  bottomStart: Radius.circular(10.r),
                ),
        ),
        child: Column(
          crossAxisAlignment:
              isFromMe ? CrossAxisAlignment.start : CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    message.content!,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: isFromMe
                              ? AppColors.white
                              : Theme.of(context).primaryColor,
                          fontSize: AppFontSize.details,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
