import 'package:bns360_graduation_project/core/helpers/localization_helper.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/shared_data/entities/job_entity.dart';
import '../../requirements_widget/requirements_builder.dart';
import 'add_requirement_button.dart';

class AddRequirementsSection extends StatelessWidget {
  const AddRequirementsSection({
    super.key,
    this.onAdd,
    this.jobEntity,
  });

  final void Function(String)? onAdd;
  final JobEntity? jobEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddRequirementButton(onAdd: onAdd),
        RequirementsBuilder(
          requirements: LocalizationHelper.getLocalizedValue(
                context,
                ar: jobEntity?.requirementsArabic.requirements,
                en: jobEntity?.requirementEnglish.requirements,
              ) as List<String>? ??
              [],
          isReadOnly: false,
        ),
      ],
    );
  }
}
