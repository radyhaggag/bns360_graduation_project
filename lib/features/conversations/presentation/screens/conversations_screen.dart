import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/injector_container.dart';
import '../bloc/conversations_bloc.dart';
import '../widgets/conversations_screen/conversations_screen_app_bar.dart';
import '../widgets/conversations_screen/conversations_screen_body.dart';

class ConversationsScreen extends StatelessWidget {
  const ConversationsScreen({super.key});

  static Widget getWithBlocProvider() {
    return BlocProvider(
      create: (context) =>
          sl<ConversationsBloc>()..add(GetConversationsEvent()),
      child: const ConversationsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ConversationsScreenAppBar(),
      body: ConversationsScreenBody(),
    );
  }
}
