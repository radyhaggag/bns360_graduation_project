import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../../core/widgets/custom_back_button.dart';
import 'craftsman_head_actions.dart';
import 'craftsman_head_background.dart';
import 'craftsman_main_card.dart';

class CraftsmanHead extends StatelessWidget {
  const CraftsmanHead({
    super.key,
    required this.craftsmanEntity,
  });

  final CraftsmanEntity craftsmanEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).listTileTheme.tileColor,
      child: Stack(
        children: [
          const CraftsmanHeadBackground(),
          CraftsmanHeadActions(
            craftsmanEntity: craftsmanEntity,
          ),
          Container(
            margin: EdgeInsets.only(top: 50.h),
            child: CraftsmanMainCard(
              craftsmanEntity: craftsmanEntity,
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
