import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/extensions/context.dart';
import '../widgets/about/info_widget.dart';
import '../../../../generated/l10n.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.listTileTheme.tileColor,
      appBar: AppBar(
        title: Text(S.of(context).privacyPolicyTitle),
        titleTextStyle: context.textTheme.titleMedium?.copyWith(
          fontSize: AppFontSize.subTitle,
        ),
      ),
      body: Column(
        children: [
          AboutWidget(
            message: S.of(context).privacyPolicyContent,
          ),
        ],
      ),
    );
  }
}
