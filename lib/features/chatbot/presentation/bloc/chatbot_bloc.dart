import 'dart:async';

import 'package:bns360_graduation_project/features/chatbot/domain/repositories/chatbot_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../conversations/domain/entities/message_entity.dart';

part 'chatbot_event.dart';
part 'chatbot_state.dart';

class ChatbotBloc extends Bloc<ChatbotEvent, ChatbotState> {
  final ChatbotRepo chatbotRepo;

  ChatbotBloc({
    required this.chatbotRepo,
  }) : super(ChatbotInitial()) {
    on<ChatbotGetMessages>(_getChatbotMessages);
    on<UpdateChatbotMessagesEvent>(_updateChatbotMessages);
    on<SendChatbotMessageEvent>(_sendChatbotMessage);
  }

  List<MessageEntity> _messages = [];
  List<MessageEntity> get messages => _messages;

  StreamSubscription<List<MessageEntity>>? _messagesStream;
  Stream<List<MessageEntity>>? messagesStream;

  _getChatbotMessages(
    ChatbotGetMessages event,
    Emitter<ChatbotState> emit,
  ) async {
    emit(GetChatbotMessagesLoadingState());

    final res = chatbotRepo.getConversationMessages();

    res.fold(
      (l) {
        _isInitialized = true;
        emit(GetChatbotMessagesErrorState(message: l.message));
      },
      (r) {
        messagesStream = r;

        _messagesStream = r.listen((messages) {
          add(UpdateChatbotMessagesEvent(messages: messages));
        });
      },
    );
  }

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  bool get isMessagesEmpty => messages.isEmpty;
  final textInputController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  _updateChatbotMessages(
    UpdateChatbotMessagesEvent event,
    Emitter<ChatbotState> emit,
  ) {
    if (isInitialized && messages.isNotEmpty && scrollController.hasClients) {
      emit(GetChatbotMessagesSuccessState(
        messages: messages,
        scrollToDown: true,
      ));
    }
    _isInitialized = true;

    _messages = event.messages;
    emit(GetChatbotMessagesSuccessState(messages: messages));
  }

  @override
  close() async {
    super.close();
    _messagesStream?.cancel();
    textInputController.dispose();
  }

  _sendChatbotMessage(
    SendChatbotMessageEvent event,
    Emitter<ChatbotState> emit,
  ) async {
    emit(SendChatbotMessageLoadingState());
    final res = await chatbotRepo.sendMessage(event.message);

    res.fold(
      (l) => emit(SendChatbotMessageErrorState(message: l.message)),
      (r) => emit(SendChatbotMessageSuccessState()),
    );
  }
}
