import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/main_list_view_builder.dart';
import '../../bloc/properties_bloc.dart';

class AddPropertyPickedImagesBuilder extends StatelessWidget {
  const AddPropertyPickedImagesBuilder({super.key, required this.images});

  final List<File> images;

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return const SizedBox.shrink();
    }
    return MainListViewBuilder(
      list: images,
      height: 80.h,
      width: context.width,
      itemWidget: (file, index) {
        return Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 5, end: 5),
              child: Image.file(
                file,
                width: 80.w,
                height: 80.h,
                fit: BoxFit.cover,
              ),
            ),
            InkWell(
              onTap: () {
                context.read<PropertiesBloc>().add(
                      RemovePickedPropertyImageEvent(index: index),
                    );
              },
              child: Container(
                height: 15.r,
                width: 15.r,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.red,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  size: 10.r,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }
}
