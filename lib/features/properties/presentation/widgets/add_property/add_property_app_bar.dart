import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_back_button.dart';

class AddPropertyScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const AddPropertyScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const CustomBackButton(),
      title: Text(S.of(context).find_your_home),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
