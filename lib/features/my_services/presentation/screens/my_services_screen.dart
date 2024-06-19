import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/my_services_bloc.dart';
import '../widgets/my_service_screen_app_bar.dart';
import '../widgets/my_services_body.dart';

class MyServicesScreen extends StatelessWidget {
  const MyServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyServicesBloc, MyServicesState>(
      listener: (context, state) {
        if (state is DeleteMyServiceSuccessState) {
          context.read<MyServicesBloc>().add(GetMyServicesEvent());
        }
      },
      child: const SafeArea(
        child: Scaffold(
          appBar: MyServicesScreenAppBar(),
          body: MyServicesBody(),
        ),
      ),
    );
  }
}
