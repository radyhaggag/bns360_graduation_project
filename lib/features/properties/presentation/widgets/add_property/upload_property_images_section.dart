import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/assets/app_svg.dart';
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
        final isRemoveEnabled = pickedImages.length == 4;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomElevatedButtonWithIcon(
              onPressed: () => _onPressed(context, isRemoveEnabled),
              isExpanded: false,
              borderRadius: BorderRadius.circular(8),
              label: isRemoveEnabled
                  ? S.of(context).remove_images
                  : S.of(context).upload_property_images,
              leading: isRemoveEnabled
                  ? SvgPicture.asset(
                      AppSvg.deletePost,
                      colorFilter: const ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    )
                  : const Icon(Icons.file_upload_outlined),
              backgroundColor: isRemoveEnabled
                  ? AppColors.red
                  : context.theme.cardColor.withOpacity(.7),
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
            AddPropertyPickedImagesBuilder(
              images: pickedImages,
            ),
          ],
        );
      },
    );
  }

  void _onPressed(BuildContext context, bool isRemoveEnabled) {
    if (isRemoveEnabled) {
      context.read<PropertiesBloc>().add(
            ClearPropertyImagesEvent(),
          );
    } else {
      context.read<PropertiesBloc>().add(
            PickPropertyImagesEvent(),
          );
    }
  }
}
