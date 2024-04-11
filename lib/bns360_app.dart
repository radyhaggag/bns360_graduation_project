import 'package:bns360_graduation_project/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/injector_container.dart';
import 'config/route_config.dart';
import 'config/theme_config.dart';
import 'core/app/app_bloc.dart';
import 'core/utils/app_strings.dart';
import 'core/utils/enums.dart';
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
          BlocProvider(
            create: (context) => sl<ProfileBloc>()..add(GetProfileEvent()),
          ),
        ],
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            ScreenUtil.init(context);
            return MaterialApp(
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
