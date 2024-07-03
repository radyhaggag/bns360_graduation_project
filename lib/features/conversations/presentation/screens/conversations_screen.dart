import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/conversations_bloc.dart';
import '../widgets/conversations_screen/conversations_screen_app_bar.dart';
import '../widgets/conversations_screen/conversations_screen_body.dart';

class ConversationsScreen extends StatefulWidget {
  const ConversationsScreen({super.key});

  // static Widget getWithBlocProvider() {
  //   return BlocProvider(
  //     create: (context) =>
  //         sl<ConversationsBloc>()..add(GetConversationsEvent()),
  //     child: const ConversationsScreen(),
  //   );
  // }

  @override
  State<ConversationsScreen> createState() => _ConversationsScreenState();

  // static ParticipantEntity? currentParticipant =
  //     AppProvider().getProfile()!.toParticipant();
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  @override
  void initState() {
    super.initState();

    context.read<ConversationsBloc>().add(GetConversationsEvent());
  }

  @override
  void deactivate() {
    context.read<ConversationsBloc>().customParticipant = null;

    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ConversationsScreenAppBar(),
      body: ConversationsScreenBody(),
    );
  }
}
