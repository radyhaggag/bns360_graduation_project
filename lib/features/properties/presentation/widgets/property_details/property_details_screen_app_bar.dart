import 'package:flutter/material.dart';

import '../../../../../core/shared_data/entities/property_entity.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_back_button.dart';
import '../../../../../core/widgets/property_card/save_property_btn.dart';

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
        SavePropertyBtn(
          propertyId: propertyEntity.id,
          notSavedColor: AppColors.white,
        ),
      ],
    );
  }
}
