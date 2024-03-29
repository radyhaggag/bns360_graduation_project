import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/shared_data/entities/category_entity.dart';
import '../core/shared_data/entities/category_item_entity.dart';
import '../core/shared_data/entities/craftsman_entity.dart';
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
import '../features/categories/presentation/screens/category_items_screen.dart';
import '../features/category_item/presentation/bloc/category_item_bloc.dart';
import '../features/category_item/presentation/screens/category_item_review_summary_screen.dart';
import '../features/category_item/presentation/screens/category_item_screen.dart';
import '../features/conversations/domain/params/conversation_screen_params.dart';
import '../features/conversations/presentation/bloc/conversations_bloc.dart';
import '../features/conversations/presentation/screens/conversation_screen.dart';
import '../features/conversations/presentation/screens/conversations_screen.dart';
import '../features/crafts/presentation/bloc/crafts_bloc.dart';
import '../features/crafts/presentation/screens/crafts_screen.dart';
import '../features/craftsman/presentation/bloc/craftsman_bloc.dart';
import '../features/craftsman/presentation/screens/craftsman_review_summary_screen.dart';
import '../features/craftsman/presentation/screens/craftsman_screen.dart';
import '../features/favorites/presentation/bloc/favorites_bloc.dart';
import '../features/favorites/presentation/screens/favorites_screen.dart';
import '../features/home/presentation/bloc/home_bloc.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/jobs/domain/entities/job_entity.dart';
import '../features/jobs/presentation/bloc/jobs_bloc.dart';
import '../features/jobs/presentation/screens/add_job_screen.dart';
import '../features/jobs/presentation/screens/job_details_screen.dart';
import '../features/jobs/presentation/screens/jobs_screen.dart';
import '../features/map/domain/params/map_params.dart';
import '../features/map/presentation/bloc/map_bloc.dart';
import '../features/map/presentation/screens/map_screen.dart';
import '../features/profile/presentation/bloc/profile_bloc.dart';
import '../features/profile/presentation/screen/edit_profile_screen.dart';
import '../features/properties/domain/entities/property_entity.dart';
import '../features/properties/presentation/bloc/properties_bloc.dart';
import '../features/properties/presentation/screens/add_property_screen.dart';
import '../features/properties/presentation/screens/properties_screen.dart';
import '../features/properties/presentation/screens/property_details_screen.dart';
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
  static const categoryItems = '/categoryItems';
  static const map = '/map';
  static const conversations = '/conversations';
  static const conversation = '/conversation';
  static const jobDetails = '/jobDetails';
  static const jobs = '/jobs';
  static const addJob = '/addJob';
  static const propertyDetails = '/propertyDetails';
  static const properties = '/properties';
  static const addProperty = '/addProperty';
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
            create: (context) =>
                sl<FavoritesBloc>()..add(GetFavoriteCategoriesEvent()),
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
      case Routes.categoryItems:
        final item = settings.arguments as CategoryEntity;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<CategoriesBloc>()
              ..add(GetCategoryItemsByIdEvent(
                categoryId: item.id,
              )),
            child: CategoryItemsScreen(
              categoryEntity: settings.arguments as CategoryEntity,
            ),
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
      case Routes.map:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<MapBloc>(),
            child: MapScreen(
              mapParams: settings.arguments as MapParams,
            ),
          ),
        );
      case Routes.conversation:
        final params = settings.arguments as ConversationScreenParams;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<ConversationsBloc>(),
            child: ConversationScreen(
              conversationParams: params,
            ),
          ),
        );
      case Routes.conversations:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                sl<ConversationsBloc>()..add(GetConversationsEvent()),
            child: const ConversationsScreen(),
          ),
        );
      case Routes.jobs:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<JobsBloc>()..add(GetJobsEvent()),
            child: const JobsScreen(),
          ),
        );
      case Routes.jobDetails:
        return MaterialPageRoute(
          builder: (context) => JobDetailsScreen(
            jobEntity: settings.arguments as JobEntity,
          ),
        );
      case Routes.addJob:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<JobsBloc>(),
            child: const AddJobScreen(),
          ),
        );
      case Routes.properties:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                sl<PropertiesBloc>()..add(GetPropertiesEvent()),
            child: const PropertiesScreen(),
          ),
        );
      case Routes.propertyDetails:
        return MaterialPageRoute(
          builder: (context) => PropertyDetailsScreen(
            propertyEntity: settings.arguments as PropertyEntity,
          ),
        );
      case Routes.addProperty:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<PropertiesBloc>(),
            child: const AddPropertyScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
