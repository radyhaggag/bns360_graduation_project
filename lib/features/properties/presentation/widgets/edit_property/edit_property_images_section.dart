import '../../../../../core/utils/assets/app_svg.dart';
import '../../../../../core/widgets/confirm_delete_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/properties_bloc.dart';
import 'edit_property_picked_images_builder.dart';

class EditPropertyImagesSection extends StatelessWidget {
  const EditPropertyImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertiesBloc, PropertiesState>(
      builder: (context, state) {
        final pickedImages = context.read<PropertiesBloc>().pickedImages;
        final networkImages = context.read<PropertiesBloc>().networkImages;
        final isRemoveEnabled = pickedImages.length >= 4 || networkImages.isNotEmpty;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomElevatedButtonWithIcon(
              onPressed: () => _onPressed(
                isRemoveEnabled,
                context,
              ),
              isExpanded: false,
              borderRadius: BorderRadius.circular(8),
              label: isRemoveEnabled
                  ? S.of(context).remove_images
                  : S.of(context).upload_property_images,
              leading: isRemoveEnabled
                  ? SvgPicture.asset(
                      AppSvg.deletePost,
                      color: AppColors.white,
                    )
                  : const Icon(Icons.file_upload_outlined),
              backgroundColor: isRemoveEnabled
                  ? AppColors.red
                  : context.theme.cardColor.withOpacity(.7),
              foregroundColor: AppColors.white,
              fontSize: AppFontSize.details,
            ),
            if (pickedImages.isEmpty ||
                (networkImages.length < 4 && pickedImages.isEmpty)) ...[
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
            EditPropertyPickedImagesBuilder(
              images: pickedImages,
              networkImages: networkImages,
            ),
          ],
        );
      },
    );
  }

  void _onPressed(bool isRemoveEnabled, BuildContext context) {
    if (isRemoveEnabled) {
      ConfirmationDialog.show(
        context,
        onConfirm: () {
          context.read<PropertiesBloc>().add(
                ClearPropertyImagesEvent(),
              );
          Navigator.pop(context);
        },
        message: S.of(context).delete_property_images,
      );
    } else {
      context.read<PropertiesBloc>().add(
            PickPropertyImagesEvent(),
          );
    }
  }
}
