import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/assets/app_svg.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/core/widgets/confirm_delete_pop_up.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreIcon extends StatelessWidget {
  const MoreIcon({
    super.key,
    required this.onDelete,
    required this.onEdit,
    required this.deleteMessage,
  });

  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final String deleteMessage;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) async {
        if (value == S.of(context).edit) {
          onEdit.call();
        }
        if (value == S.of(context).delete) {
          ConfirmationDialog.show(
            context,
            onConfirm: () {
              onDelete.call();
              Navigator.pop(context);
            },
            message: deleteMessage,
          );
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem(
          value: S.of(context).edit,
          child: Row(
            children: <Widget>[
              SvgPicture.asset(
                AppSvg.editPost,
              ),
              const SizedBox(width: 8),
              Text(
                S.of(context).edit,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: AppFontSize.details,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: S.of(context).delete,
          child: Row(
            children: <Widget>[
              SvgPicture.asset(
                AppSvg.deletePost,
              ),
              const SizedBox(width: 8),
              Text(
                S.of(context).delete,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.red,
                  fontSize: AppFontSize.details,
                ),
              ),
            ],
          ),
        ),
      ],
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).hintColor.withOpacity(0.1),
        ),
        child: const Icon(Icons.more_vert),
      ),
    );
  }
}
