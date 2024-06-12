import '../../../../../core/utils/extensions/language.dart';
import 'package:flutter/material.dart';

import '../requirements_widget/add_requirement_button.dart';
import '../requirements_widget/requirements_builder.dart';

class AddRequirementsSection extends StatelessWidget {
  const AddRequirementsSection({
    super.key,
    this.onAdd,
  });

  final void Function(String)? onAdd;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddRequirementButton(onAdd: onAdd),
        RequirementsBuilder(
          withTranslation: false,
          isReadOnly: false,
          language: context.currentLanguage,
        ),
      ],
    );
  }
}
