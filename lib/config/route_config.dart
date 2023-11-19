import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/sign_up_screen.dart';
import '../features/auth/presentation/screens/welcome_screen.dart';
import '../features/home/presentation/bloc/home_bloc.dart';
import '../features/home/presentation/screens/home_screen.dart';
import 'injector_container.dart';

abstract class Routes {
  static const welcome = '/welcome';
  static const login = '/login';
  static const signUp = '/signUp';
  static const home = '/home';
}

abstract class RouteConfig {
  static Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcome:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: const WelcomeScreen(),
          ),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<HomeBloc>(),
            child: const HomeScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
