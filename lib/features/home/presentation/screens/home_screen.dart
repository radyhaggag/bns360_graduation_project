import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../widgets/bottom_navbar/main_bottom_navbar.dart';
import '../widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).home),
      ),
      body: const HomeBody(),
      bottomNavigationBar: const MainBottomNavbar(),
    );
  }
}
