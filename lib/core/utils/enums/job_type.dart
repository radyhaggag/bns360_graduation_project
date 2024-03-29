import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';

enum JobType {
  partTime,
  fullTime;

  JobType fromInteger(int hours) {
    if (hours > 4) return JobType.partTime;
    return JobType.fullTime;
  }

  String getLocalizedString(BuildContext context) {
    return switch (this) {
      partTime => S.of(context).part_time,
      fullTime => S.of(context).part_time
    };
  }
}
