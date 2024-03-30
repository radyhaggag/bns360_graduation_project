import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/core/widgets/custom_slider/custom_slider.dart';
import 'package:bns360_graduation_project/features/jobs/presentation/widgets/job_card/save_job_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/property_entity.dart';

class PropertyCardImagesSection extends StatelessWidget {
  const PropertyCardImagesSection({super.key, required this.propertyEntity});

  final PropertyEntity propertyEntity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.symmetric(horizontal: 3).copyWith(top: 8),
          decoration: const BoxDecoration(),
          child: CustomSlider(
            images: propertyEntity.propertyImagesUrls,
            height: 110.h,
            viewPaginationBars: false,
            imagesRadius: 16,
          ),
        ),
        SaveJobBtn(
          isSaved: true,
          notSavedBackgroundColor: context.theme.highlightColor.withAlpha(150),
        ),
      ],
    );
  }
}
