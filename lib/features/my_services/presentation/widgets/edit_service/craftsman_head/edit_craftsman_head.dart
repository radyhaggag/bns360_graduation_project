import 'package:bns360_graduation_project/core/shared_data/entities/craftsman_entity.dart';
import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:bns360_graduation_project/core/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'edit_craftsman_head_background.dart';
import 'edit_craftsman_main_card.dart';

class EditCraftsmanHead extends StatelessWidget {
  const EditCraftsmanHead({
    super.key,
    required this.craftsmanEntity,
  });

  final CraftsmanEntity craftsmanEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor(context),
      child: Stack(
        children: [
          const EditCraftsmanHeadBackground(),
          Container(
            margin: EdgeInsets.only(top: 50.h),
            child: EditCraftsmanMainCard(
              imageUrl: craftsmanEntity.imageUrl,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const CustomBackButton(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
