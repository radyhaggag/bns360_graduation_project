import 'package:bns360_graduation_project/features/chatbot/presentation/bloc/chatbot_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/data_state_widget.dart';
import '../../../../../core/widgets/empty_card.dart';
import '../../../../../generated/l10n.dart';
import 'chatbot_messages_builder.dart';
import 'chatbot_text_field.dart';

class ChatbotBody extends StatelessWidget {
  const ChatbotBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ChatbotBloc>();
    return BlocConsumer<ChatbotBloc, ChatbotState>(
      listener: (context, state) {
        if (state is SendChatbotMessageSuccessState) {
          _scrollToBottom(bloc);
        }

        if (state is GetChatbotMessagesSuccessState && state.scrollToDown) {
          Future.delayed(const Duration(milliseconds: 500)).then((_) {
            _scrollToBottom(bloc);
          });
        }
      },
      buildWhen: (previous, current) {
        final states = [
          GetChatbotMessagesLoadingState,
          GetChatbotMessagesErrorState,
          GetChatbotMessagesSuccessState,
        ];
        return states.contains(current.runtimeType);
      },
      builder: (context, state) {
        final errorMsg =
            (state is GetChatbotMessagesErrorState) ? state.message : "";
        return DataStateWidget(
          isError: state is GetChatbotMessagesErrorState,
          errorMessage: errorMsg,
          isLoaded: bloc.isInitialized,
          isLoading: !bloc.isInitialized,
          loadedWidget: Column(
            children: [
              Expanded(
                child: bloc.messages.isEmpty
                    ? const _EmptyWidget()
                    : const ChatbotMessagesBuilder(),
              ),
              ChatbotTextField(
                textEditingController: bloc.textInputController,
              ),
            ],
          ),
        );
      },
    );
  }

  void _scrollToBottom(ChatbotBloc bloc) {
    bloc.scrollController.animateTo(
      bloc.scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
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
