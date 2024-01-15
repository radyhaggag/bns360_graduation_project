import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/injector_container.dart';
import 'config/route_config.dart';
import 'config/theme_config.dart';
import 'core/localization/localization_bloc.dart';
import 'core/utils/app_strings.dart';
import 'generated/l10n.dart';

class BNS360App extends StatelessWidget {
  const BNS360App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocalizationBloc>(
      create: (context) => sl<LocalizationBloc>()..add(GetSavedLanguage()),
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocBuilder<LocalizationBloc, LocalizationState>(
          builder: (context, state) {
            ScreenUtil.init(context);
            ThemeConfig.configureStatusBarColor();
            if (state is ChangeLocalState) {
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
                theme: ThemeConfig.getLightTheme(),
                onGenerateRoute: RouteConfig.getRoute,
                initialRoute: Routes.splash,
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
