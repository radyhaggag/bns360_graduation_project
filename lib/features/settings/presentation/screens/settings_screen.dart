import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/injector_container.dart';
import '../../../../core/utils/extensions/context.dart';
import '../bloc/settings_bloc.dart';
import '../widgets/settings_body.dart';
import '../widgets/settings_screen_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static Widget getWithBlocProvider() {
    return BlocProvider(
      create: (context) => sl<SettingsBloc>(),
      child: const SettingsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.listTileTheme.tileColor,
      appBar: const SettingsScreenAppBar(),
      body: const SettingsBody(),
    );
  }
}
