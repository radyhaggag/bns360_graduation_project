import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/injector_container.dart';
import 'config/navigation_service.dart';
import 'config/route_config.dart';
import 'config/theme_config.dart';
import 'core/app/app_bloc.dart';
import 'core/helpers/update_helper.dart';
import 'core/utils/app_strings.dart';
import 'core/utils/enums.dart';
import 'features/conversations/presentation/bloc/conversations_bloc.dart';
import 'features/favorites/presentation/bloc/favorites_bloc.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';
import 'features/saved_items/presentation/bloc/saved_bloc.dart';
import 'generated/l10n.dart';

class BNS360App extends StatefulWidget {
  const BNS360App({super.key});

  @override
  State<BNS360App> createState() => _BNS360AppState();
}

class _BNS360AppState extends State<BNS360App> {
  @override
  void initState() {
    super.initState();
    UpdateHelper.checkForInAppUpdate();

    ThemeConfig.configureStatusBarColor();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
            create: (context) => sl<AppBloc>(),
          ),
          BlocProvider<FavoritesBloc>(
            create: (context) => sl<FavoritesBloc>(),
          ),
          BlocProvider<SavedBloc>(
            create: (context) => sl<SavedBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<ProfileBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<ConversationsBloc>(),
          ),
        ],
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            ScreenUtil.init(context);
            return MaterialApp(
              navigatorKey: NavigationService.navigatorKey,
              supportedLocales: S.delegate.supportedLocales,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: state.locale,
              debugShowCheckedModeBanner: false,
              title: AppStrings.appName,
              theme: state.theme == AppTheme.light
                  ? ThemeConfig.getLightTheme()
                  : ThemeConfig.getDarkTheme(),
              onGenerateRoute: RouteConfig.getRoute,
              initialRoute: Routes.splash,
            );
          },
        ),
      ),
    );
  }
}
