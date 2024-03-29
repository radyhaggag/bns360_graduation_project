import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/enums/job_type.dart';
import '../../../../../generated/l10n.dart';

class JobTypeRadioTile extends StatelessWidget {
  const JobTypeRadioTile({super.key, this.value, this.onChanged});

  final JobType? value;
  final void Function(JobType?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).job_type,
          style: context.textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).cardColor,
          ),
        ),
        _RadioItem(
          selectedValue: value,
          value: JobType.partTime,
          onChanged: onChanged,
        ),
        _RadioItem(
          selectedValue: value,
          value: JobType.fullTime,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _RadioItem extends StatelessWidget {
  const _RadioItem({
    this.selectedValue,
    required this.value,
    required this.onChanged,
  });

  final JobType value;
  final JobType? selectedValue;
  final void Function(JobType? p1)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<JobType?>(
          value: value,
          groupValue: selectedValue,
          onChanged: onChanged,
        ),
        Text(
          value.getLocalizedString(context),
          style: context.textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).cardColor,
          ),
        ),
      ],
    );
  }
}
