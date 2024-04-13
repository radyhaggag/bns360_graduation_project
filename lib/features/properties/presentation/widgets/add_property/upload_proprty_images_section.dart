import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/properties_bloc.dart';
import 'add_property_picked_images_builder.dart';

class UploadPropertyImagesSection extends StatelessWidget {
  const UploadPropertyImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertiesBloc, PropertiesState>(
      builder: (context, state) {
        final pickedImages = context.read<PropertiesBloc>().pickedImages;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomElevatedButtonWithIcon(
              onPressed: pickedImages.length < 4
                  ? () {
                      context.read<PropertiesBloc>().add(
                            PickPropertyImagesEvent(),
                          );
                    }
                  : null,
              isExpanded: false,
              borderRadius: BorderRadius.circular(8),
              label: S.of(context).upload_property_images,
              leading: const Icon(Icons.file_upload_outlined),
              backgroundColor: context.theme.cardColor.withOpacity(.7),
              foregroundColor: AppColors.white,
              fontSize: AppFontSize.details,
            ),
            if (pickedImages.isEmpty) ...[
              const SizedBox(height: 10),
              Text(
                S.of(context).max_no_of_image_uploads(4),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.theme.hoverColor,
                  fontSize: AppFontSize.light,
                ),
              ),
            ],
            const SizedBox(height: 10),
            AddPropertyPickedImagesBuilder(images: pickedImages),
          ],
        );
      },
    );
  }
}

