import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../../bloc/auth_bloc.dart';

class NotReceiveTile extends StatelessWidget {
  final String email;
  const NotReceiveTile({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          S.of(context).notReceiveCode,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).hintColor,
              ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {
            context.read<AuthBloc>().add(SendResetPasswordCodeEvent(
                  email: email,
                ));
          },
          child: Text(
            S.of(context).resend,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).cardColor,
                ),
          ),
        ),
      ],
    );
  }
}
