import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/data_state_widget.dart';
import '../../../../../core/widgets/empty_card.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/params/conversation_screen_params.dart';
import '../../../domain/params/send_message_params.dart';
import '../../bloc/conversations_bloc.dart';
import 'chat_message_text_field.dart';
import 'messages_builder.dart';

class ConversationScreenBody extends StatelessWidget {
  const ConversationScreenBody({
    super.key,
    required this.conversationParams,
  });

  final ConversationScreenParams conversationParams;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ConversationsBloc>();
    return BlocConsumer<ConversationsBloc, ConversationsState>(
      listener: (context, state) {
        if (state is SendMessageSuccessState) {
          _scrollToBottom(bloc);
        }

        if (state is ConversationLoadedState) {
          Future.delayed(const Duration(milliseconds: 500)).then((_) {
            _scrollToBottom(bloc);
          });
        }
      },
      buildWhen: (previous, current) {
        final states = [
          GetConversationMessagesLoadingState,
          GetConversationMessagesErrorState,
          GetConversationMessagesSuccessState,
        ];
        return states.contains(current.runtimeType);
      },
      builder: (context, state) {
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
              const SizedBox(height: 10),
              ChatMessageTextField(
                onPressSendIcon: (content) {
                  _sendMessage(context: context, content: content);
                },
                onSuffixIconPressed: () => bloc.add(PicKMessageImageEvent()),
              ),
            ],
          ),
        );
      },
    );
  }

  void _scrollToBottom(ConversationsBloc bloc) {
    bloc.scrollController.animateTo(
      bloc.scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  _sendMessage({
    required BuildContext context,
    required String content,
  }) {
    final bloc = context.read<ConversationsBloc>();
    bloc.add(SendMessageEvent(
      sendMessageParams: SendMessageParams(
        content: content,
        otherParticipant: conversationParams.participantEntity,
        isFirstMsg: bloc.messages.isEmpty,
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
