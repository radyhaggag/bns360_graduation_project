import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/shared_data/entities/participant_entity.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../core/widgets/icons/profile_circle_icon.dart';

class ConversationsScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ConversationsScreenAppBar({
    super.key,
    required this.otherParticipant,
  });

  final ParticipantEntity otherParticipant;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          const CustomBackButton(),
          ClipOval(
            child: ProfileCircleIcon(
              height: 45.r,
              width: 45.r,
              imageUrl: otherParticipant.imageUrl,
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            title(context),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }

  String title(BuildContext context) {
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
