import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/localization_helper.dart';
import '../../../../../core/widgets/custom_back_button.dart';
import '../../../../../core/widgets/icons/profile_circle_icon.dart';
import '../../../domain/params/conversation_screen_params.dart';

class ConversationScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ConversationScreenAppBar({
    super.key,
    required this.conversationParams,
  });

  final ConversationScreenParams conversationParams;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      decoration: BoxDecoration(
        color: context.theme.highlightColor,
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          const CustomBackButton(),
          InkWell(
            onTap: () {
              conversationParams.navigationRoute(context);
            },
            child: Row(
              children: [
                ClipOval(
                  child: ProfileCircleIcon(
                    height: 45.r,
                    width: 45.r,
                    imageUrl: conversationParams.participantEntity.imageUrl,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  title(context),
                  style: context.textTheme.titleSmall,
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }

  String title(BuildContext context) {
    final otherParticipant = conversationParams.participantEntity;

    final titleAR = otherParticipant.nameAR ?? otherParticipant.nameEN;
    final titleEN = otherParticipant.nameEN ?? otherParticipant.nameAR;
    return LocalizationHelper.getLocalizedString(
      context,
      ar: titleAR ?? "",
      en: titleEN ?? "",
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
