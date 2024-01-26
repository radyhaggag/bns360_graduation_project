import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import 'crafts_search_icon.dart';

class CraftsScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CraftsScreenAppBar({super.key});

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
        S.of(context).craftsmen,
      ),
      actions: const [
        CraftsSearchIcon(),
      ],
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
