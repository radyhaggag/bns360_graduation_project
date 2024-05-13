import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/buttons/custom_buttons.dart';
import 'add_requirement_dialog.dart';

class AddRequirementButton extends StatelessWidget {
  const AddRequirementButton({
    super.key,
    required this.onAdd,
  });

  final void Function(String)? onAdd;

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButtonWithIcon(
      label: S.of(context).add_requirement,
      backgroundColor: AppColors.backgroundColor(context),
      borderRadius: BorderRadius.circular(8.0),
      leading: Icon(
        Icons.add_circle,
        color: context.theme.cardColor,
        size: 25.r,
      ),
      isExpanded: false,
      foregroundColor: context.theme.cardColor,
      onPressed: () {
        AddRequirementDialog.show(
          context: context,
          onAdd: onAdd,
        );
      },
    );
  }
}
