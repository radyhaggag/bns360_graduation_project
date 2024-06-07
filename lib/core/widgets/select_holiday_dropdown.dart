import 'package:bns360_graduation_project/core/utils/enums/work_days.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_dropdown.dart';
import '../../../../generated/l10n.dart';

class SelectHolidayDropdown extends StatefulWidget {
  const SelectHolidayDropdown({
    super.key,
    this.initialHoliday = WorkDay.friday,
    required this.onChange,
  });

  final WorkDay initialHoliday;
  final Function(WorkDay holiday) onChange;

  @override
  State<SelectHolidayDropdown> createState() => _SelectHolidayDropdownState();
}

class _SelectHolidayDropdownState extends State<SelectHolidayDropdown> {
  late WorkDay selectedHoliday;

  @override
  void initState() {
    super.initState();
    selectedHoliday = widget.initialHoliday;
  }

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
          value: selectedHoliday,
          onTapCallback: (value) {
            setState(() => selectedHoliday = value);
            widget.onChange(value);
          },
          items: WorkDay.values.map((e) => e).toList(),
          viewItems: WorkDay.values.map((e) => getTextValue(e)).toList(),
          label: S.of(context).select_service_category,
          textValue: getTextValue(selectedHoliday),
          horizontalPadding: 0,
        ),
      ],
    );
  }

  String getTextValue(WorkDay? holiday) {
    return holiday?.name ?? '';
  }
}
