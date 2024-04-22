import 'package:bns360_graduation_project/core/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class SavedScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SavedScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      title: Text(
        S.of(context).saved,
      ),
      centerTitle: true,
      leading: const CustomBackButton(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
