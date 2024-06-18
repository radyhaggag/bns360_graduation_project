import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IsAlwaysAvailableDropdown extends StatelessWidget {
  const IsAlwaysAvailableDropdown({
    super.key,
    required this.isAlwaysAvailable,
    required this.onChanged,
  });

  final bool isAlwaysAvailable;

  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).working_24_hours_question,
          style: context.textTheme.titleSmall,
        ),
        15.verticalSpace,
        Row(
          children: [
            Expanded(
              child: RadioListTile<bool>.adaptive(
                title: Text(
                  S.of(context).yes,
                  style: context.textTheme.bodyMedium,),
                value: isAlwaysAvailable,
                groupValue: true,
                onChanged: (value) {
                  onChanged.call(true);
                },
              ),
            ),
            Expanded(
              child: RadioListTile<bool>.adaptive(
                title: Text(
                  S.of(context).no,
                  style: context.textTheme.bodyMedium,
                ),
                value: isAlwaysAvailable,
                groupValue: false,
                onChanged: (value) {
                  onChanged.call(false);
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
