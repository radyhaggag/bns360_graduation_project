import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class ConversationsScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ConversationsScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        S.of(context).conversations,
      ),
      leading: const SizedBox.shrink(),
      centerTitle: false,
      leadingWidth: 20,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
