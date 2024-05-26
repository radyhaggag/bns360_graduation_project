import 'package:bns360_graduation_project/core/widgets/icons/save_icon.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared_data/entities/property_entity.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_back_button.dart';

class PropertyDetailsScreenAppBar extends StatelessWidget {
  const PropertyDetailsScreenAppBar({super.key, required this.propertyEntity});

  final PropertyEntity propertyEntity;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.primary,
      leading: const CustomBackButton(
        color: Colors.white,
      ),
      actions: [
        SaveIcon(
          itemId: propertyEntity.id,
          isJob: false,
          notSavedColor: AppColors.white,
        ),
      ],
    );
  }
}
