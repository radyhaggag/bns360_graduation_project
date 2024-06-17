import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

enum WorkDay {
  sunday(0),
  monday(1),
  tuesday(2),
  wednesday(3),
  thursday(4),
  friday(5),
  saturday(6),
  none(7);

  final int id;

  const WorkDay(this.id);

  static WorkDay fromId(int id) {
    return WorkDay.values.firstWhere((element) => element.id == id);
  }

  static WorkDay fromString(String day) {
    switch (day) {
      case 'Sunday':
        return WorkDay.sunday;
      case 'Monday':
        return WorkDay.monday;
      case 'Tuesday':
        return WorkDay.tuesday;
      case 'Wednesday':
        return WorkDay.wednesday;
      case 'Thursday':
        return WorkDay.thursday;
      case 'Friday':
        return WorkDay.friday;
      case 'Saturday':
        return WorkDay.saturday;
      default:
        throw WorkDay.none;
    }
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
        return t.friday;
      case 6:
        return t.saturday;
      case 7:
        return t.always_available;
      default:
        return '';
    }
  }
}

// extension WorkDaysExtension on WorkDay {
//   int get id {
//     switch (this) {
//       case WorkDay.monday:
//         return 1;
//       case WorkDay.tuesday:
//         return 2;
//       case WorkDay.wednesday:
//         return 3;
//       case WorkDay.thursday:
//         return 4;
//       case WorkDay.friday:
//         return 5;
//       default:
//         throw Exception('Invalid work day');
//     }
//   }
// }
