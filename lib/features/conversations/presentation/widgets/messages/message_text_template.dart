import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../generated/l10n.dart';
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
          color: isFromMe ? AppColors.primary : context.theme.highlightColor,
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
                if (message.isDeleted) ...[
                  Icon(
                    Icons.not_interested,
                    color: getColor(context),
                  ),
                  SizedBox(width: 5.w),
                ],
                Flexible(
                  child: Text(
                    _getContent(context),
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: getColor(context),
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

  Color getColor(BuildContext context) {
    final color =
        message.isFromMe ? AppColors.white : context.theme.primaryColor;
    if (message.isDeleted) {
      return color.withOpacity(.7);
    }
    return color;
  }

  String _getContent(BuildContext context) {
    if (!message.isDeleted) {
      return message.content!;
    }
    final isFromMe = message.isFromMe;
    if (isFromMe) {
      return S.of(context).you_deleted_this_message;
    } else {
      return S.of(context).delete_by_sender;
    }
  }
}
