import '../../../../config/injector_container.dart';
import '../../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/properties_bloc.dart';
import '../widgets/properties_screen/properties_body.dart';
import '../widgets/properties_screen/properties_screen_app_bar.dart';

class PropertiesScreen extends StatelessWidget {
  const PropertiesScreen({super.key});

  static Widget getWithBlocProvider() {
    return BlocProvider(
      create: (context) => sl<PropertiesBloc>()..add(GetPropertiesEvent()),
      child: const PropertiesScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor(context),
      appBar: const PropertiesScreenAppBar(),
      body: const PropertiesBody(),
    );
  }
}
