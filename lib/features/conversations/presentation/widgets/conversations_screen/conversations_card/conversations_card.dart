import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/date_formatter.dart';
import '../../../../../../core/helpers/localization_helper.dart';
import '../../../../../../core/shared_data/entities/participant_entity.dart';
import '../../../../../../core/utils/app_fonts.dart';
import '../../../../../../core/utils/extensions/context.dart';
import '../../../../../../core/widgets/main_network_image.dart';
import '../../../../domain/entities/conversation_entity.dart';

part 'message_date_and_unread_count_section.dart';
part 'user_name_and_last_message_section.dart';

class ConversationCard extends StatelessWidget {
  final ConversationEntity conversationEntity;
  final Function onPressed;

  const ConversationCard({
    super.key,
    required this.conversationEntity,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (conversationEntity.participants.isEmpty) {
      return const SizedBox();
    }

    final otherUser = conversationEntity.otherParticipant;

    if (otherUser == null) {
      return const SizedBox.shrink();
    }
    return InkWell(
      onTap: () => onPressed.call(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.theme.highlightColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MainNetworkImage(
              imageUrl: otherUser.imageUrl,
              isCircular: true,
              width: 55.r,
              height: 55.r,
              name: name(context, otherUser),
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: _UserNameAndLastMessageSection(
                userName: name(context, otherUser) ?? "",
                lastMessage: conversationEntity.lastMessage.content ??
                    conversationEntity.lastMessage.imageUrl ??
                    "",
              ),
            ),
            SizedBox(width: 15.w),
            _MessageDateAndUnreadCountSection(
              lastMessageDate: conversationEntity.lastMessage.date,
              unreadCount: conversationEntity.currentUserUnreadCount,
            ),
          ],
        ),
      ),
    );
  }

  String? name(BuildContext context, ParticipantEntity? otherUser) {
    final titleAR = otherUser?.nameAR ?? otherUser?.nameEN;
    final titleEN = otherUser?.nameEN ?? otherUser?.nameAR;
    return LocalizationHelper.getLocalizedString(
      context,
      ar: titleAR ?? "",
      en: titleEN ?? "",
    );
  }
}
