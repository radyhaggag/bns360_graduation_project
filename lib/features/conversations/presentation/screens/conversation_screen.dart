import 'package:bns360_graduation_project/core/helpers/chat_params_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/params/conversation_screen_params.dart';
import '../bloc/conversations_bloc.dart';
import '../widgets/conversation_screen_app_bar.dart';
import '../widgets/conversation_screen_body.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({
    super.key,
    required this.conversationParams,
  });

  final ConversationScreenParams conversationParams;

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  late final ConversationsBloc conversationsBloc;

  @override
  void initState() {
    super.initState();
    conversationsBloc = context.read<ConversationsBloc>();

    final params = widget.conversationParams;
    final conversationId = ChatParamsHelper.conversationId(
      otherId: params.participantEntity.id,
      otherUserType: params.participantEntity.userType,
    );
    conversationsBloc.add(GetConversationMessagesEvent(
      conversationId: conversationId,
    ));
  }

  @override
  void deactivate() {
    conversationsBloc.add(ClearCurrentSessionEvent());
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).listTileTheme.tileColor,
      appBar: ConversationsScreenAppBar(
        conversationParams: widget.conversationParams,
      ),
      body: ConversationScreenBody(
        conversationParams: widget.conversationParams,
      ),
    );
  }
}
