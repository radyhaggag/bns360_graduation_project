import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_back_button.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../generated/l10n.dart';

class AddPropertyScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const AddPropertyScreenAppBar({super.key});

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
