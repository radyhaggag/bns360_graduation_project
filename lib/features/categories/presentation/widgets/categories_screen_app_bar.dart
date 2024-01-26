import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class CategoriesScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CategoriesScreenAppBar({super.key});

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
        S.of(context).categories,
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
