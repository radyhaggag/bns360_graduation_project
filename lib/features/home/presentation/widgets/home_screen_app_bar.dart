import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../core/widgets/icons/profile_circle_icon.dart';
import '../../../../generated/l10n.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: AppBar(
        centerTitle: false,
        title: Text(
          S.of(context).appName,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              FeatherIcons.messageCircle,
              size: 30,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const ProfileCircleIcon(),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
