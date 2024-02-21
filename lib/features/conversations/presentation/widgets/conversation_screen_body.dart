import 'package:bns360_graduation_project/core/utils/enums/message_type.dart';
import 'package:bns360_graduation_project/core/widgets/data_state_widget.dart';
import 'package:bns360_graduation_project/core/widgets/empty_card.dart';
import 'package:bns360_graduation_project/features/conversations/domain/params/conversation_screen_params.dart';
import 'package:bns360_graduation_project/features/conversations/domain/params/send_message_params.dart';
import 'package:bns360_graduation_project/features/conversations/presentation/bloc/conversations_bloc.dart';
import 'package:bns360_graduation_project/features/conversations/presentation/widgets/chat_message_text_field.dart';
import 'package:bns360_graduation_project/features/conversations/presentation/widgets/messages/messages_builder.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationScreenBody extends StatefulWidget {
  const ConversationScreenBody({
    super.key,
    required this.conversationParams,
  });

  final ConversationScreenParams conversationParams;

  @override
  State<ConversationScreenBody> createState() => _ConversationScreenBodyState();
}

class _ConversationScreenBodyState extends State<ConversationScreenBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConversationsBloc, ConversationsState>(
      listener: (context, state) {},
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
              ChatMessageTextField(
                onPressSendIcon: _sendMessage,
              ),
            ],
          ),
        );
      },
    );
  }

  _sendMessage(String content) {
    final bloc = context.read<ConversationsBloc>();
    bloc.add(SendMessageEvent(
      sendMessageParams: SendMessageParams(
        content: content,
        messageType: MessageType.text,
        otherParticipant: widget.conversationParams.participantEntity,
        isFirstMsg: bloc.messages.isEmpty,
        unreadCountEntity: bloc.currentConversation?.unreadCount,
      ),
    ));
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
