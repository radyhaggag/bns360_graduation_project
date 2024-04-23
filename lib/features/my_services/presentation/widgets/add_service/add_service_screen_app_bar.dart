import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_back_button.dart';

class AddServiceScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const AddServiceScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      leading: const CustomBackButton(),
      // title: Text(
      //   isUpdate ? S.of(context).edit_post : S.of(context).add_a_job,
      // ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
