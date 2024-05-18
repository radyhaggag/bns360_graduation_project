import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../generated/l10n.dart';
import '../requirements_widget/add_requirement_button.dart';
import '../requirements_widget/requirements_builder.dart';

class EditRequirementsSection extends StatelessWidget {
  const EditRequirementsSection({
    super.key,
    this.onAdd,
  });

  final void Function(String)? onAdd;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddRequirementButton(onAdd: onAdd),
        10.verticalSpace,
        Text(
          "${S.of(context).requirements}\t(${S.of(context).in_arabic})",
          style: context.textTheme.titleSmall,
        ),
        const RequirementsBuilder(
          isReadOnly: false,
          withTranslation: true,
          language: Language.arabic,
        ),
        10.verticalSpace,
        Text(
          "${S.of(context).requirements}\t(${S.of(context).in_english})",
          style: context.textTheme.titleSmall,
        ),
        const RequirementsBuilder(
          isReadOnly: false,
          withTranslation: true,
          language: Language.english,
        ),
      ],
    );
  }
}
