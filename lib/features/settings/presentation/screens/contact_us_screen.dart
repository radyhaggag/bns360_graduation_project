import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../widgets/about/info_widget.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.listTileTheme.tileColor,
      appBar: AppBar(
        title: Text(S.of(context).contactUsTitle),
        titleTextStyle: context.textTheme.titleMedium?.copyWith(
          fontSize: AppFontSize.subTitle,
        ),
      ),
      body: Column(
        children: [
          AboutWidget(
            message: S.of(context).contactUsContent,
          ),
          InkWell(
            onTap: () {
              String url = 'mailto:$email';
              launchUrlString(url);
            },
            child: AboutWidget(
              title: S.of(context).for_inquiries_and_suggestions,
              message: email,
            ),
          ),
          InkWell(
            onTap: () {
              String url = 'mailto:$email';
              launchUrlString(url);
            },
            child: AboutWidget(
              title: S.of(context).for_support,
              message: email,
            ),
          ),
        ],
      ),
    );
  }

  String get email {
    return "bns360.guide@gmail.com";
  }
}
