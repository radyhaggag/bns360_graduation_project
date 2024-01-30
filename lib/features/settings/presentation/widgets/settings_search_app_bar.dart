import 'package:flutter/material.dart';

import '../../../../core/widgets/icons/profile_circle_icon.dart';
import '../../../../generated/l10n.dart';

class SettingsScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SettingsScreenAppBar({super.key, this.imageUrl});

  final String? imageUrl;

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
        S.of(context).settings,
      ),
      centerTitle: false,
      actions: [
        ProfileCircleIcon(imageUrl: imageUrl),
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
