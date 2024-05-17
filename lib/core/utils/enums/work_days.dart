import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';

enum WorkDay {
  sunday(0),
  monday(1),
  tuesday(2),
  wednesday(3),
  thursday(4),
  friday(5),
  saturday(6);

  final int id;

  const WorkDay(this.id);

  static WorkDay fromId(int id) {
    return WorkDay.values.firstWhere((element) => element.id == id);
  }

  static String localizedName(BuildContext context, int dayId) {
    final t = S.of(context);
    switch (dayId) {
      case 0:
        return t.sunday;
      case 1:
        return t.monday;
      case 2:
        return t.tuesday;
      case 3:
        return t.wednesday;
      case 4:
        return t.thursday;
      case 5:
        return  t.friday;
      case 6:
        return t.saturday;
      default:
        return '';
    }
  }
}

extension WorkDaysExtension on WorkDay {
  int get id {
    switch (this) {
      case WorkDay.monday:
        return 1;
      case WorkDay.tuesday:
        return 2;
      case WorkDay.wednesday:
        return 3;
      case WorkDay.thursday:
        return 4;
      case WorkDay.friday:
        return 5;
      default:
        throw Exception('Invalid work day');
    }
  }
}
