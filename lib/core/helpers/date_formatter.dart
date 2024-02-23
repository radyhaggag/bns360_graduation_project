import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class DateFormatter {
  static String formatDateTimeToNormalDate(DateTime dateTime) {
    final formatter = DateFormat('MM/dd/yyyy HH:mm');
    final formattedDate = formatter.format(dateTime);
    return formattedDate;
  }

  static DateTime parseDate(String dateStr) {
    return DateTime.parse(dateStr);
  }

  static String getSuitableDateString({
    required BuildContext context,
    required String date,
    required bool showFullDateHours,
  }) {
    final now = DateTime.now();
    final parsedDate = DateTime.parse(date);
    final difference = now.difference(parsedDate);

    if (difference.inDays >= 30 && showFullDateHours) {
      final formattedDate = DateFormat('d MMM yyyy, HH:mm').format(parsedDate);
      return formattedDate;
    } else if (difference.inDays >= 30 && !showFullDateHours) {
      final formattedDate = DateFormat('d MMM yyyy').format(parsedDate);
      return formattedDate;
    } else if (difference.inDays >= 1) {
      final daysAgo = difference.inDays;
      return S.of(context).days_ago(daysAgo);
    } else if (difference.inHours >= 1) {
      final hoursAgo = difference.inHours;
      return S.of(context).hours_ago(hoursAgo);
    } else if (difference.inMinutes >= 1) {
      final minutesAgo = difference.inMinutes;
      return S.of(context).mins_ago(minutesAgo);
    } else {
      return S.of(context).just_now;
    }
  }

  static String parsedAndFormattedDate(String date) {
    final parsedDate = DateTime.parse(date);
    final formattedDate = DateFormat('d MMM yyyy').format(parsedDate);
    return formattedDate;
  }

  /// get the date with time in 12 hour format and with morning/evening
  static String getDateWithTime12HourMorningOrEvening({
    required BuildContext context,
    required DateTime date,
    bool justTime = false,
  }) {
    // final time = format(date, "HH:mm a");
    final time = DateFormat.jm().format(date);

    if (justTime) return time;

    return '${format(date, "yyyy-MM-dd")} - $time';
  }

  static String format(DateTime date, String pattern, [String? local]) {
    String? currentLocal = local;
    // if (local == null) currentLocal = AppProvider().getLanguageCode;
    final formatter = DateFormat(pattern, currentLocal);
    return formatter.format(date);
  }

  static String dateFormatForDisplay({
    required BuildContext context,
    required DateTime dateTime,
    bool showTimeIfToday = false,
    bool showHoursAgoIfToday = false,
    bool showMinutesAgoIfToday = false,
  }) {
    String formattedDate = '';
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final aDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
    if (aDate == today) {
      int diffHours = _differenceInHours(dateTime, now);
      int diffMinutes = _differenceInMinutes(dateTime, now);

      if (showHoursAgoIfToday || showMinutesAgoIfToday) {
        if (diffMinutes < 60 && showMinutesAgoIfToday) {
          formattedDate = '${S.of(context).mins_ago(diffMinutes)}}';
        } else {
          formattedDate = "${S.of(context).hours_ago(diffHours)} ";
        }
      } else if (showTimeIfToday) {
        formattedDate = format(dateTime, "HH:mm a");
      } else {
        return S.of(context).today;
      }
    } else if (aDate == yesterday) {
      formattedDate = S.of(context).yesterday;
    } else {
      formattedDate = format(dateTime, "yyyy/MM/dd");
    }

    return formattedDate;
  }

  static int _differenceInHours(DateTime start, DateTime end) {
    final diff = end.difference(start);
    return diff.inHours;
  }

  static int _differenceInMinutes(DateTime start, DateTime end) {
    final diff = end.difference(start);
    return diff.inMinutes;
  }
}
