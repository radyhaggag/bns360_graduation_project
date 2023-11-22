import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/route_config.dart';
import '../bloc/splash_bloc.dart';
import '../widgets/splash_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is UserLoggedInState) {
            _navigateToNext(context, Routes.home);
          }
          if (state is UserNotLoggedInState) {
            _navigateToNext(context, Routes.welcome);
          }
        },
        child: const SplashBody(),
      ),
    );
  }

  void _navigateToNext(BuildContext context, String route) {
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.of(context).popAndPushNamed(route),
    );
  }
}
