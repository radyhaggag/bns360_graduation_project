import 'package:bns360_graduation_project/core/utils/assets/app_svg.dart';
import 'package:bns360_graduation_project/core/widgets/confirm_delete_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/extensions/context.dart';
import '../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../generated/l10n.dart';
import '../bloc/my_business_bloc.dart';
import 'add_business/add_business_picked_images_builder.dart';

class UploadBusinessImagesSection extends StatelessWidget {
  const UploadBusinessImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBusinessBloc, MyBusinessState>(
      builder: (context, state) {
        final pickedImages = context.read<MyBusinessBloc>().pickedImages;
        final networkImages = context.read<MyBusinessBloc>().networkImages;
        final isRemoveEnabled =
            networkImages.isNotEmpty || pickedImages.length == 4;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomElevatedButtonWithIcon(
              onPressed: () {
                _onPressed(
                  isRemoveEnabled,
                  context,
                );
              },
              isExpanded: false,
              borderRadius: BorderRadius.circular(8),
              label: isRemoveEnabled
                  ? S.of(context).remove_images
                  : S.of(context).upload_business_images,
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
            AddBusinessPickedImagesBuilder(
              images: pickedImages,
              networkImages: networkImages,
            ),
          ],
        );
      },
    );
  }

  void _onPressed(bool delete, BuildContext context) {
    if (delete) {
      ConfirmationDialog.show(
        context,
        onConfirm: () {
          context.read<MyBusinessBloc>().add(
                ClearBusinessImagesEvent(),
              );
          Navigator.pop(context);
        },
        message: S.of(context).delete_business_images,
      );
    } else {
      context.read<MyBusinessBloc>().add(
            PickBusinessImagesEvent(),
          );
    }
  }
}

class UploadMainBusinessImageSection extends StatelessWidget {
  const UploadMainBusinessImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBusinessBloc, MyBusinessState>(
      builder: (context, state) {
        final mainBusinessImage =
            context.read<MyBusinessBloc>().mainBusinessImage;
        final mainNetworkImage =
            context.read<MyBusinessBloc>().mainNetworkImage;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomElevatedButtonWithIcon(
              onPressed: () => _onPressed(
                context,
                delete: mainBusinessImage != null || mainNetworkImage != null,
              ),
              isExpanded: false,
              borderRadius: BorderRadius.circular(8),
              label: (mainBusinessImage != null || mainNetworkImage != null)
                  ? S.of(context).delete_main_business_image
                  : S.of(context).upload_main_business_image,
              leading: const Icon(Icons.file_upload_outlined),
              backgroundColor:
                  (mainBusinessImage != null || mainNetworkImage != null)
                      ? AppColors.red
                      : context.theme.cardColor.withOpacity(.7),
              foregroundColor: AppColors.white,
              fontSize: AppFontSize.details,
            ),
          ],
        );
      },
    );
  }

  void _onPressed(BuildContext context, {bool delete = false}) {
    if (delete) {
      ConfirmationDialog.show(
        context,
        onConfirm: () {
          context.read<MyBusinessBloc>().add(
                ClearMainBusinessImageEvent(),
              );
          Navigator.pop(context);
        },
        message: "${S.of(context).delete_main_business_image}?",
      );
    } else {
      context.read<MyBusinessBloc>().add(
            AddMainBusinessImageEvent(),
          );
    }
  }
}
