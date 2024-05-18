import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/injector_container.dart';
import '../../../../core/utils/app_colors.dart';
import '../bloc/crafts_bloc.dart';
import '../widgets/crafts_body.dart';
import '../widgets/crafts_screen_app_bar.dart';

class CraftsScreen extends StatelessWidget {
  const CraftsScreen({super.key});

  static Widget getWithBlocProvider() {
    return BlocProvider(
      create: (context) => sl<CraftsBloc>()
        ..add(GetCraftsEvent())
        ..add(GetCraftsmenEvent()),
      child: const CraftsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor(context),
      appBar: const CraftsScreenAppBar(),
      body: const CraftsBody(),
    );
  }
}
