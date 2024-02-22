import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/message_entity.dart';

class MessageTextTemplate extends StatelessWidget {
  const MessageTextTemplate({
    super.key,
    required this.message,
  });
  final MessageEntity message;

  @override
  Widget build(BuildContext context) {
    final isFromMe = message.isFromMe;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 0.7.sw,
      ),
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: isFromMe ? AppColors.primary : AppColors.light,
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(10.r),
            topStart: Radius.circular(10.r),
            bottomEnd: Radius.circular(isFromMe ? 4.r : 10.r),
            bottomStart: Radius.circular(isFromMe ? 10.r : 4.r),
          ),
        ),
        child: Column(
          crossAxisAlignment:
              isFromMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    message.content!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.white,
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
