import 'dart:io';

import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/core/utils/extensions/media_query.dart';
import 'package:bns360_graduation_project/core/widgets/buttons/custom_buttons.dart';
import 'package:bns360_graduation_project/core/widgets/main_list_view_builder.dart';
import 'package:bns360_graduation_project/features/properties/presentation/bloc/properties_bloc.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              onPressed: () {
                if (pickedImages.isNotEmpty) {
                  context.read<PropertiesBloc>().add(
                        RemovePickedPropertyImagesEvent(),
                      );
                } else {
                  context.read<PropertiesBloc>().add(PickPropertyImagesEvent());
                }
              },
              isExpanded: false,
              borderRadius: BorderRadius.circular(8),
              label: pickedImages.isEmpty
                  ? S.of(context).upload_property_images
                  : S.of(context).remove_picked_images,
              leading: const Icon(Icons.file_upload_outlined),
              backgroundColor: pickedImages.isEmpty
                  ? context.theme.listTileTheme.tileColor
                  : AppColors.red,
              foregroundColor: pickedImages.isEmpty
                  ? context.theme.cardColor
                  : AppColors.white,
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
            _PickedImagesSection(images: pickedImages),
          ],
        );
      },
    );
  }
}

class _PickedImagesSection extends StatelessWidget {
  const _PickedImagesSection({required this.images});

  final List<File> images;

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return const SizedBox.shrink();
    }
    return MainListViewBuilder(
      list: images,
      height: 75.h,
      width: context.width,
      itemWidget: (file, index) {
        return Image.file(
          file,
          width: 75.w,
          // height: 100.h,
          fit: BoxFit.cover,
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }
}
