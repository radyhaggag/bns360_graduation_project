import 'package:bns360_graduation_project/config/navigation_service.dart';
import 'package:bns360_graduation_project/core/widgets/icons/save_icon.dart';
import 'package:bns360_graduation_project/features/saved_items/presentation/bloc/saved_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/route_config.dart';
import '../../shared_data/entities/property_entity.dart';
import '../custom_slider/custom_slider.dart';

class PropertyCardImagesSection extends StatelessWidget {
  const PropertyCardImagesSection({
    super.key,
    required this.propertyEntity,
    this.isMiniMode = true,
    this.moreWidget,
    this.isInSavedScreen = false,
  });
  final PropertyEntity propertyEntity;
  final bool isMiniMode;
  final Widget? moreWidget;
  final bool isInSavedScreen;

  AlignmentGeometry get alignment {
    if (isMiniMode) {
      return AlignmentDirectional.bottomEnd;
    } else {
      return AlignmentDirectional.topEnd;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: alignment,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(
              Routes.propertyDetails,
              arguments: propertyEntity,
            )
                .then((_) {
              if (isInSavedScreen) {
                NavigationService.navigatorKey.currentContext!
                    .read<SavedBloc>()
                    .add(GetSavedPropertiesEvent());
              }
            });
          },
          child: Container(
            margin: isMiniMode ? const EdgeInsets.only(bottom: 15) : null,
            padding: isMiniMode
                ? const EdgeInsets.symmetric(horizontal: 3).copyWith(top: 8)
                : null,
            decoration: const BoxDecoration(),
            child: CustomSlider(
              images: propertyEntity.images,
              height: isMiniMode ? 110.h : 225.h,
              viewPaginationBars: !isMiniMode,
              imagesRadius: isMiniMode ? 16 : null,
            ),
          ),
        ),
        Padding(
          padding: isMiniMode ? EdgeInsets.zero : const EdgeInsets.all(8.0),
          child: SaveIcon(
            itemId: propertyEntity.id,
            isJob: false,
            size: 30.r,
          ),
        ),
        if (moreWidget != null) Positioned(top: 0, child: moreWidget!),
      ],
    );
  }
}
