import '../../../../../core/utils/extensions/context.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';
import 'change_password_form.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Text(
              S.of(context).change_password,
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(height: 50),
            const ChangePasswordForm(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
