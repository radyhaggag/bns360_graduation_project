import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_back_button.dart';

class AddPropertyScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const AddPropertyScreenAppBar({super.key, required this.isUpdate});

  final bool isUpdate;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const CustomBackButton(),
      title: Text(
        isUpdate ? S.of(context).edit_post : S.of(context).add_property,
        style: context.textTheme.titleMedium?.copyWith(
          fontSize: AppFontSize.titleMedium,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
