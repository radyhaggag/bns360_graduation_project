import 'package:flutter/material.dart';

import '../widgets/password_changed/password_changed_body.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PasswordChangedBody(),
    );
  }
}
