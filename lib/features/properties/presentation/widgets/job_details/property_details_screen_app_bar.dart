import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_back_button.dart';
import '../../../../jobs/presentation/widgets/job_card/save_job_btn.dart';
import '../../../domain/entities/property_entity.dart';

class PropertyDetailsScreenAppBar extends StatelessWidget {
  const PropertyDetailsScreenAppBar({super.key, required this.propertyEntity});

  final PropertyEntity propertyEntity;

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.primary,
      leading: CustomBackButton(
        color: Colors.white,
      ),
      actions: [
        SaveJobBtn(
          notSavedColor: AppColors.white,
        ),
      ],
    );
  }
}
