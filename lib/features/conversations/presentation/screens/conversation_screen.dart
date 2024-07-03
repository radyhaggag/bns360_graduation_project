import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/chat_params_helper.dart';
import '../../../../core/utils/extensions/context.dart';
import '../../domain/params/conversation_screen_params.dart';
import '../bloc/conversations_bloc.dart';
import '../widgets/conversation_screen/conversation_screen_app_bar.dart';
import '../widgets/conversation_screen/conversation_screen_body.dart';

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
  late String conversationId;

  @override
  void initState() {
    super.initState();
    conversationsBloc = context.read<ConversationsBloc>();
    final currentParticipant = conversationsBloc.currentParticipant;
    final params = widget.conversationParams;
    conversationId = widget.conversationParams.conversationId ??
        ChatParamsHelper.conversationId(
          otherId: params.participantEntity.modifiedId,
          otherUserType: params.participantEntity.userType,
          currentUserId: currentParticipant.modifiedId,
          currentUserType: currentParticipant.userType,
        );
    conversationsBloc.add(GetConversationMessagesEvent(
      conversationId: conversationId,
    ));
  }

  @override
  void deactivate() {
    final otherParticipant = widget.conversationParams.participantEntity;
    conversationsBloc.add(ResetCurrentUnreadCountEvent(
      otherParticipantId: otherParticipant.modifiedId,
      otherParticipantType: otherParticipant.userType,
      conversationId: conversationId,
    ));
    conversationsBloc.add(ClearCurrentSessionEvent());
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.listTileTheme.tileColor,
        appBar: ConversationScreenAppBar(
          conversationParams: widget.conversationParams,
        ),
        body: ConversationScreenBody(
          conversationParams: widget.conversationParams.copyWith(
            conversationId: conversationId,
          ),
        ),
      ),
    );
  }
}
