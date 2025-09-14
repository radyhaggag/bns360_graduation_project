import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_back_button.dart';
import '../../../../generated/l10n.dart';

class FavoritesScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const FavoritesScreenAppBar({super.key});

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
        S.of(context).favorites,
      ),
      centerTitle: true,
      leading: const CustomBackButton(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
