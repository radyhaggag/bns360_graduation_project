import 'package:bns360_graduation_project/core/utils/enums/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_dropdown.dart';

class TimeDurationDropdown extends StatelessWidget {
  const TimeDurationDropdown({
    super.key,
    required this.value,
    required this.onTapCallback,
  });

  final TimeDuration value;
  final Function(TimeDuration) onTapCallback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: CustomDropdown<TimeDuration>(
        value: value,
        onTapCallback: (value) => onTapCallback(value),
        items: TimeDuration.values,
        viewItems: TimeDuration.values.map((e) => e.name(context)).toList(),
        label: value.name(context),
        customChild: <Widget>(TimeDuration value) => Text(
          value.name(context),
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
