import 'package:bns360_graduation_project/core/shared_data/entities/craftsman_entity.dart';
import 'package:bns360_graduation_project/features/category_item/presentation/screens/category_item_review_summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/shared_data/entities/category_item_entity.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/auth/presentation/screens/forgot_password_screen.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/password_changed_screen.dart';
import '../features/auth/presentation/screens/reset_password_screen.dart';
import '../features/auth/presentation/screens/sign_up_screen.dart';
import '../features/auth/presentation/screens/verify_otp_code_screen.dart';
import '../features/auth/presentation/screens/welcome_screen.dart';
import '../features/bottom_navigation/presentation/bloc/bottom_navigation_bloc.dart';
import '../features/bottom_navigation/presentation/screens/bottom_navigation_screen.dart';
import '../features/categories/presentation/bloc/categories_bloc.dart';
import '../features/categories/presentation/screens/categories_screen.dart';
import '../features/category_item/presentation/bloc/category_item_bloc.dart';
import '../features/category_item/presentation/screens/category_item_screen.dart';
import '../features/crafts/presentation/bloc/crafts_bloc.dart';
import '../features/crafts/presentation/screens/crafts_screen.dart';
import '../features/craftsman/presentation/bloc/craftsman_bloc.dart';
import '../features/craftsman/presentation/screens/category_item_review_summary_screen.dart';
import '../features/craftsman/presentation/screens/craftsman_screen.dart';
import '../features/favorites/presentation/bloc/favorites_bloc.dart';
import '../features/favorites/presentation/screens/favorites_screen.dart';
import '../features/home/presentation/bloc/home_bloc.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/profile/presentation/bloc/profile_bloc.dart';
import '../features/profile/presentation/screen/edit_profile_screen.dart';
import '../features/settings/presentation/bloc/settings_bloc.dart';
import '../features/settings/presentation/screens/settings_screen.dart';
import '../features/splash/presentation/bloc/splash_bloc.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import 'injector_container.dart';

abstract class Routes {
  static const splash = '/splash';
  static const welcome = '/welcome';
  static const login = '/login';
  static const signUp = '/signUp';
  static const forgotPassword = '/forgotPassword';
  static const verifyOtpCode = '/verifyOtpCode';
  static const resetPassword = '/resetPassword';
  static const passwordChanged = '/passwordChanged';
  static const home = '/home';
  static const bottomNavBar = '/bottomNavBar';
  static const favorites = '/favorites';
  static const categories = '/categories';
  static const crafts = '/crafts';
  static const settings = '/settings';
  static const editProfile = '/editProfile';
  static const categoryItem = '/categoryItem';
  static const categoryItemReviewSummary = '/categoryItemReviewSummary';
  static const craftsman = '/craftsman';
  static const craftsmanReviewSummary = '/craftsmanReviewSummary';
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
      case Routes.verifyOtpCode:
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
            child: const BottomNavigationScreen(),
          ),
        );
      case Routes.favorites:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<FavoritesBloc>(),
            child: const FavoritesScreen(),
          ),
        );
      case Routes.categories:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<CategoriesBloc>(),
            child: const CategoriesScreen(),
          ),
        );
      case Routes.crafts:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<CraftsBloc>(),
            child: const CraftsScreen(),
          ),
        );
      case Routes.settings:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<SettingsBloc>(),
            child: const SettingsScreen(),
          ),
        );
      case Routes.editProfile:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<ProfileBloc>()..add(GetProfileEvent()),
            child: const EditProfileScreen(),
          ),
        );
      case Routes.categoryItem:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<CategoryItemBloc>(),
            child: CategoryItemScreen(
              categoryItemEntity: settings.arguments as CategoryItemEntity,
            ),
          ),
        );
      case Routes.categoryItemReviewSummary:
        return MaterialPageRoute(
          builder: (context) {
            final item = settings.arguments as CategoryItemEntity;
            return BlocProvider(
              create: (context) => sl<CategoryItemBloc>()
                ..add(GetCategoryItemReviewsEvent(
                  itemId: item.id.toString(),
                )),
              child: CategoryItemReviewSummaryScreen(
                categoryItemEntity: item,
              ),
            );
          },
        );
      case Routes.craftsman:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<CraftsmanBloc>(),
            child: CraftsmanScreen(
              craftsmanEntity: settings.arguments as CraftsmanEntity,
            ),
          ),
        );

      case Routes.craftsmanReviewSummary:
        return MaterialPageRoute(
          builder: (context) {
            final item = settings.arguments as CraftsmanEntity;
            return BlocProvider(
              create: (context) => sl<CraftsmanBloc>()
                ..add(GetCraftsmanReviewsEvent(
                  itemId: item.id.toString(),
                )),
              child: CraftsmanReviewSummaryScreen(
                craftsmanEntity: item,
              ),
            );
          },
        );
      default:
        return null;
    }
  }
}
