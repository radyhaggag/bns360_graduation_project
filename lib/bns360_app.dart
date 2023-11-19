import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/injector_container.dart';
import 'config/route_config.dart';
import 'config/theme_config.dart';
import 'core/localization/localization_bloc.dart';
import 'core/utils/app_strings.dart';
import 'core/utils/constants.dart';
import 'generated/l10n.dart';

class BNS360App extends StatelessWidget {
  const BNS360App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocalizationBloc>(
      create: (context) => sl<LocalizationBloc>()..add(GetSavedLanguage()),
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, state) {
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
              initialRoute: token != null ? Routes.home : Routes.welcome,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
