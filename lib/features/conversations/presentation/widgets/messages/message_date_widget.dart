import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/date_formatter.dart';

class MessageDateWidget extends StatelessWidget {
  const MessageDateWidget({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormatter.getDateWithTime12HourMorningOrEvening(
        context: context,
        date: date,
        justTime: true,
      ),
      style: context.textTheme.bodySmall,
    );
  }
}
