import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/extensions/context.dart';
import '../bloc/chatbot_bloc.dart';
import '../widgets/chatbot_body.dart';
import '../widgets/chatbot_screen_app_bar.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({
    super.key,
  });

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  late final ChatbotBloc chatbotBloc;

  @override
  void initState() {
    super.initState();
    chatbotBloc = context.read<ChatbotBloc>();
    chatbotBloc.add(ChatbotGetMessages());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.listTileTheme.tileColor,
      appBar: const ChatbotScreenAppBar(),
      body: const ChatbotBody(),
    );
  }
}
