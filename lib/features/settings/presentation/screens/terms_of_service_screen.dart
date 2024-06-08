import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../widgets/about/info_widget.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.listTileTheme.tileColor,
      appBar: AppBar(
        title: Text(S.of(context).termsOfServiceTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AboutWidget(
              message: S.of(context).termsOfServiceContent,
            ),
          ],
        ),
      ),
    );
  }
}
