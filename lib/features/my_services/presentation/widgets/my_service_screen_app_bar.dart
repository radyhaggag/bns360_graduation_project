import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_back_button.dart';

class MyServicesScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const MyServicesScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      leading: const CustomBackButton(),
      // title: Text(S.of(context).my_service),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
