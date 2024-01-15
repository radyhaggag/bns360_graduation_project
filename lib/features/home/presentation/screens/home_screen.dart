import 'package:flutter/material.dart';

import '../widgets/bottom_navbar/main_bottom_navbar.dart';
import '../widgets/home_body.dart';
import '../widgets/home_screen_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeScreenAppBar(),
      body: HomeBody(),
      bottomNavigationBar: MainBottomNavbar(),
    );
  }
}
