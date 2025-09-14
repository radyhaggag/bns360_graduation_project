import '../../../../core/utils/assets/app_images.dart';
import '../../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/widgets/custom_back_button.dart';

class ChatbotScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ChatbotScreenAppBar({super.key});

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
          SizedBox(width: 10.w),
          const CustomBackButton(),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  AppImages.chatbot,
                  width: 75,
                  height: 75,
                ),
              ),
              Text(
                S.of(context).chatbot,
                style: context.textTheme.titleSmall,
              ),
            ],
          ),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
