import 'package:flutter/material.dart';

import '../widgets/profile/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ProfileBody(),
      ),
    );
  }
}
