import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_back_button.dart';
import '../../../../../generated/l10n.dart';

class AddJobScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const AddJobScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: AppColors.primary,
      leading: const CustomBackButton(),
      title: Text(S.of(context).add_a_job),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
