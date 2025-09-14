import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/extensions/context.dart';
import '../widgets/about/about_us/social_media_list_items.dart';
import '../../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/about/info_widget.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.listTileTheme.tileColor,
      appBar: AppBar(
        title: Text(S.of(context).aboutUsTitle),
        titleTextStyle: context.textTheme.titleMedium?.copyWith(
          fontSize: AppFontSize.subTitle,
        ),
      ),
      body: Column(
        children: [
          AboutWidget(
            message: S.of(context).aboutUsContent,
          ),
          25.verticalSpace,
          const SocialMediaListItems(),
        ],
      ),
    );
  }
}
