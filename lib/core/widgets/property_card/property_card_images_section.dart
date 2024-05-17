import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/route_config.dart';
import '../../shared_data/entities/property_entity.dart';
import '../../utils/extensions/context.dart';
import '../custom_slider/custom_slider.dart';
import 'save_property_btn.dart';

class PropertyCardImagesSection extends StatelessWidget {
  const PropertyCardImagesSection({
    super.key,
    required this.propertyEntity,
    this.isMiniMode = true,
    this.moreWidget,
  });
  final PropertyEntity propertyEntity;
  final bool isMiniMode;
  final Widget? moreWidget;

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
            Navigator.of(context).pushNamed(
              Routes.propertyDetails,
              arguments: propertyEntity,
            );
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
          child: SavePropertyBtn(
            propertyId: propertyEntity.id,
            notSavedBackgroundColor: context.theme.highlightColor.withAlpha(
              150,
            ),
            size: 30.r,
          ),
        ),
        if (moreWidget != null) Positioned(top: 0, child: moreWidget!),
      ],
    );
  }
}
