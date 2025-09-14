import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_dropdown.dart';
import '../../../../generated/l10n.dart';
import '../utils/enums/work_days.dart';
import '../utils/extensions/context.dart';

class SelectHolidayDropdown extends StatelessWidget {
  const SelectHolidayDropdown({
    super.key,
    this.value = WorkDay.friday,
    required this.onChange,
  });

  final WorkDay value;
  final Function(WorkDay holiday) onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).select_holiday,
          style: context.textTheme.titleSmall,
        ),
        10.verticalSpace,
        CustomDropdown<WorkDay>(
          value: value,
          onTapCallback: (value) {
            onChange(value);
          },
          items: WorkDay.values.map((e) => e).toList(),
          viewItems:
              WorkDay.values.map((e) => getTextValue(context, e)).toList(),
          label: S.of(context).select_service_category,
          textValue: getTextValue(context, value),
          horizontalPadding: 0,
        ),
      ],
    );
  }

  String getTextValue(BuildContext context, WorkDay? holiday) {
    return WorkDay.localizedName(context, holiday?.id ?? WorkDay.none.id);
  }
}
