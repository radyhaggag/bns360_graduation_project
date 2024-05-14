import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/main_list_view_builder.dart';
import '../../../../../core/widgets/main_network_image.dart';
import '../../../../../core/widgets/remove_icon.dart';
import '../../bloc/my_business_bloc.dart';

class AddBusinessPickedImagesBuilder extends StatelessWidget {
  const AddBusinessPickedImagesBuilder({
    super.key,
    required this.images,
    required this.networkImages,
  });

  final List<File> images;
  final List<String> networkImages;

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty && networkImages.isEmpty) {
      return const SizedBox.shrink();
    }
    return MainListViewBuilder(
      list: images.isNotEmpty ? images : networkImages,
      height: 80.h,
      width: context.width,
      itemWidget: (object, index) {
        return Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 5, end: 5),
              child: object is File
                  ? Image.file(
                      object,
                      width: 80.w,
                      height: 80.h,
                      fit: BoxFit.cover,
                    )
                  : MainNetworkImage(
                      imageUrl: object.toString(),
                      width: 80.w,
                      height: 80.h,
                      fit: BoxFit.cover,
                    ),
            ),
            if (networkImages.isEmpty)
              RemoveIcon(
                onTap: () {
                  context.read<MyBusinessBloc>().add(
                        RemovePickedBusinessImageEvent(index: index),
                      );
                },
              ),
          ],
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }
}
