import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/assets/app_svg.dart';
import '../../../../core/utils/extensions/context.dart';
import '../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../core/widgets/confirm_pop_up.dart';
import '../../../../generated/l10n.dart';
import '../bloc/my_services_bloc.dart';
import 'add_service/add_service_picked_images_builder.dart';

class UploadServiceImagesSection extends StatelessWidget {
  const UploadServiceImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyServicesBloc, MyServicesState>(
      builder: (context, state) {
        final pickedImages = context.read<MyServicesBloc>().pickedImages;
        // final networkImages = context.read<MyServicesBloc>().networkImages;

        // bool isRemoveEnabled =
        //     (networkImages.isNotEmpty || pickedImages.length == 4);
        bool isRemoveEnabled = (pickedImages.length == 4);

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
                  : S.of(context).upload_service_images,
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
            // if (pickedImages.isEmpty ||
            //     (networkImages.length < 4 && pickedImages.isEmpty)) ...[
            //   const SizedBox(height: 10),
            //   Text(
            //     S.of(context).max_no_of_image_uploads(4),
            //     style: context.textTheme.bodyMedium?.copyWith(
            //       color: context.theme.hoverColor,
            //       fontSize: AppFontSize.light,
            //     ),
            //   ),
            // ],
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
            AddServicePickedImagesBuilder(
              images: pickedImages,
              // networkImages: networkImages,
              networkImages: const [],
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
          context.read<MyServicesBloc>().add(
                ClearServiceImagesEvent(),
              );
          Navigator.pop(context);
        },
        message: S.of(context).delete_service_images,
      );
    } else {
      context.read<MyServicesBloc>().add(
            PickServiceImagesEvent(),
          );
    }
  }
}

class UploadMainServiceImageSection extends StatelessWidget {
  const UploadMainServiceImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyServicesBloc, MyServicesState>(
      builder: (context, state) {
        final mainServiceImage =
            context.read<MyServicesBloc>().mainServiceImage;
        final mainNetworkImage =
            context.read<MyServicesBloc>().mainNetworkImage;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomElevatedButtonWithIcon(
              onPressed: () => _onPressed(
                context,
                delete: mainServiceImage != null || mainNetworkImage != null,
              ),
              isExpanded: false,
              borderRadius: BorderRadius.circular(8),
              label: (mainServiceImage != null || mainNetworkImage != null)
                  ? S.of(context).delete_main_service_image
                  : S.of(context).upload_main_service_image,
              leading: const Icon(Icons.file_upload_outlined),
              backgroundColor:
                  (mainServiceImage != null || mainNetworkImage != null)
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
          context.read<MyServicesBloc>().add(
                ClearMainServiceImageEvent(),
              );
          Navigator.pop(context);
        },
        message: "${S.of(context).delete_main_service_image}?",
      );
    } else {
      context.read<MyServicesBloc>().add(
            AddMainServiceImageEvent(),
          );
    }
  }
}
