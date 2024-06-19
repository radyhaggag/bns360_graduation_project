import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';

enum TimeDuration {
  am,
  pm;

  String name(BuildContext context) {
    switch (this) {
      case TimeDuration.am:
        return S.of(context).am;
      case TimeDuration.pm:
        return S.of(context).pm;
      default:
        return "";
    }
  }

  static TimeDuration fromString(String value) {
    switch (value) {
      case "am":
        return TimeDuration.am;
      case "pm":
        return TimeDuration.pm;
      default:
        return TimeDuration.am;
    }
  }

  static String from24To12HoursOnly(int hour, BuildContext context) {
    if (hour == 0) {
      return "12 ${TimeDuration.am.name(context)}";
    } else if (hour < 12) {
      return "$hour ${TimeDuration.am.name(context)}";
    } else if (hour == 12) {
      return "12 ${TimeDuration.pm.name(context)}";
    } else {
      return "${hour - 12} ${TimeDuration.pm.name(context)}";
    }
  }

  static int convertTo24Format(int hour, TimeDuration timeDuration) {
    if (timeDuration == TimeDuration.am) {
      if (hour == 12) {
        return 0;
      }
      return hour;
    } else {
      if (hour == 12) {
        return 12;
      }
      return hour + 12;
    }
  }

  static int convertTo12Format(int hour) {
    if (hour == 0) {
      return 12;
    } else if (hour < 12) {
      return hour;
    } else if (hour == 12) {
      return 12;
    } else {
      return hour - 12;
    }
  }

  static TimeDuration from24Hours(int hour) {
    if (hour < 12) {
      return TimeDuration.am;
    } else {
      return TimeDuration.pm;
    }
  }

  static bool isOpenWithRange24Format(int start, int end) {
    final now = DateTime.now().hour;
    if (start == 0 && end == 0) {
      return true;
    } else if (start < end) {
      return now >= start && now < end;
    } else {
      return now >= start || now < end;
    }
  }
}
