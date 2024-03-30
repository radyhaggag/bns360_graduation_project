import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/core/widgets/buttons/custom_buttons.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class UploadPropertyImagesSection extends StatelessWidget {
  const UploadPropertyImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomElevatedButtonWithIcon(
          onPressed: () {},
          isExpanded: false,
          borderRadius: BorderRadius.circular(8),
          label: S.of(context).upload_property_images,
          leading: const Icon(Icons.file_upload_outlined),
          backgroundColor: context.theme.listTileTheme.tileColor,
          foregroundColor: context.theme.cardColor,
          fontSize: AppFontSize.details,
        ),
        const SizedBox(height: 10),
        Text(
          S.of(context).max_no_of_image_uploads(4),
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.theme.hoverColor,
            fontSize: AppFontSize.light,
          ),
        ),
      ],
    );
  }
}
