import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/main_logger.dart';
import '../../../../core/widgets/data_state_widget.dart';
import '../../../../core/widgets/empty_card.dart';
import '../../../../generated/l10n.dart';
import '../../domain/params/conversation_screen_params.dart';
import '../bloc/conversations_bloc.dart';
import '../widgets/chat_message_text_field.dart';
import '../widgets/conversation_screen_app_bar.dart';
import '../widgets/messages/messages_builder.dart';

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

    logger.i(params);

    if (params.conversation == null) {
      conversationsBloc.add(CheckIfConversationExistEvent(
        participantId: params.participantEntity.id,
      ));
    } else {
      conversationsBloc.add(GetConversationMessagesEvent(
        conversationEntity: params.conversation!,
      ));
    }
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
        otherParticipant: widget.conversationParams.participantEntity,
      ),
      body: BlocConsumer<ConversationsBloc, ConversationsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final bloc = context.read<ConversationsBloc>();
          final errorMsg =
              (state is GetConversationMessagesErrorState) ? state.message : "";
          return DataStateWidget(
            isError: state is GetConversationMessagesErrorState,
            errorMessage: errorMsg,
            isLoaded: bloc.isInitialized,
            isLoading: !bloc.isInitialized,
            loadedWidget: Column(
              children: [
                Expanded(
                  child: bloc.messages.isEmpty
                      ? const _EmptyWidget()
                      : const MessagesBuilder(),
                ),
                const ChatMessageTextField(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: EmptyCard(
        title: S.of(context).there_are_no_messages_yet,
      ),
    );
  }
}

class LoadedWidget extends StatelessWidget {
  const LoadedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
