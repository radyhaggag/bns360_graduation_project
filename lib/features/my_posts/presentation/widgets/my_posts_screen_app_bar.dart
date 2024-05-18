import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_back_button.dart';
import '../../../../generated/l10n.dart';

class MyPostsScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const MyPostsScreenAppBar({super.key});

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
        S.of(context).my_posts,
      ),
      centerTitle: true,
      leading: const CustomBackButton(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
