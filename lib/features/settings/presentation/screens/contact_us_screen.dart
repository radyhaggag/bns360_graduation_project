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
      ),
      body: Column(
        children: [
          AboutWidget(
            message: S.of(context).contactUsContent,
          ),
          InkWell(
            onTap: () {
              String url = 'mailto:radyhaggag11@gmail.com';
              launchUrlString(url);
            },
            child: AboutWidget(
              title: S.of(context).for_inquiries_and_suggestions,
              message: "radyhaggag11@gmail.com",
            ),
          ),
          InkWell(
            onTap: () {
              String url = 'mailto:radyhaggag11@gmail.com';
              launchUrlString(url);
            },
            child: AboutWidget(
              title: S.of(context).for_support,
              message: "radyhaggag11@gmail.com",
            ),
          ),
        ],
      ),
    );
  }
}
