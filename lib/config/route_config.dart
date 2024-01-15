import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/auth/presentation/screens/forgot_password_screen.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/password_changed_screen.dart';
import '../features/auth/presentation/screens/reset_password_screen.dart';
import '../features/auth/presentation/screens/sign_up_screen.dart';
import '../features/auth/presentation/screens/verify_reset_password_code_screen.dart';
import '../features/auth/presentation/screens/welcome_screen.dart';
import '../features/bottom_nav_bar/presentation/bloc/bottom_nav_bar_bloc.dart';
import '../features/bottom_nav_bar/presentation/screens/bottom_nav_bar_screen.dart';
import '../features/home/presentation/bloc/home_bloc.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/splash/presentation/bloc/splash_bloc.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import 'injector_container.dart';

abstract class Routes {
  static const splash = '/splash';
  static const welcome = '/welcome';
  static const login = '/login';
  static const signUp = '/signUp';
  static const forgotPassword = '/forgotPassword';
  static const verifyResetPasswordCode = '/verifyResetPasswordCode';
  static const resetPassword = '/resetPassword';
  static const passwordChanged = '/passwordChanged';
  static const home = '/home';
  static const bottomNavBar = '/bottomNavBar';
}

abstract class RouteConfig {
  static Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<SplashBloc>()
              ..add(
                CheckUserLoginStatusEvent(),
              ),
            child: const SplashScreen(),
          ),
        );
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
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: const ForgotPasswordScreen(),
          ),
        );
      case Routes.verifyResetPasswordCode:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: VerifyResetPasswordCodeScreen(
              email: settings.arguments as String,
            ),
          ),
        );
      case Routes.resetPassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: ResetPasswordScreen(
              email: settings.arguments as String,
            ),
          ),
        );
      case Routes.passwordChanged:
        return MaterialPageRoute(
          builder: (context) => const PasswordChangedScreen(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<HomeBloc>()..add(GetPlacesToExploreEvent()),
            child: const HomeScreen(),
          ),
        );
      case Routes.bottomNavBar:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => BottomNavBarBloc(),
            child: const BottomNavBarScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
