import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../widgets/edit_service/edit_service_body/edit_service_body.dart';

class EditServiceScreen extends StatelessWidget {
  const EditServiceScreen({
    super.key,
    required this.craftsmanEntity,
  });

  final CraftsmanEntity craftsmanEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor(context),
      body: EditServiceBody(
        craftsmanEntity: craftsmanEntity,
      ),
    );
  }
}
