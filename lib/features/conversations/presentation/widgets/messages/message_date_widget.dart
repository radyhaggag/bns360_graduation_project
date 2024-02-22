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
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
