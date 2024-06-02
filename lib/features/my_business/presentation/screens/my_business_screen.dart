import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/my_business_bloc.dart';
import '../widgets/my_business_body.dart';
import '../widgets/my_business_screen_app_bar.dart';

class MyBusinessScreen extends StatelessWidget {
  const MyBusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyBusinessBloc, MyBusinessState>(
      listener: (context, state) {
        if (state is GetBusinessTypesSuccessState) {
          context.read<MyBusinessBloc>().add(GetMyBusinessEvent());
        }
      },
      child: const Scaffold(
        appBar: MyBusinessScreenAppBar(),
        body: MyBusinessBody(),
      ),
    );
  }
}
