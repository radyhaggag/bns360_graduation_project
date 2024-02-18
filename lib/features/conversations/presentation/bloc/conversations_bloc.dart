import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/conversation_entity.dart';
import '../../domain/entities/message_entity.dart';
import '../../domain/params/send_message_params.dart';
import '../../domain/repositories/conversations_repo.dart';

part 'conversations_event.dart';
part 'conversations_state.dart';

class ConversationsBloc extends Bloc<ConversationsEvent, ConversationsState> {
  final ConversationsRepo conversationsRepo;

  ConversationsBloc({
    required this.conversationsRepo,
  }) : super(ConversationsInitial()) {
    on<SendMessageEvent>(_sendMessage);
    on<GetConversationsEvent>(_getConversations);
    on<UpdateConversationsEvent>(_updateConversations);
    on<CheckIfConversationExistEvent>(_checkIfConversationExist);
    on<GetConversationMessagesEvent>(_getConversationMessages);
    on<UpdateConversationMessagesEvent>(_updateConversationMessages);
    on<ClearCurrentSessionEvent>(_clearCurrentSession);
  }

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  bool get isMessagesEmpty => messages.isEmpty;

  _sendMessage(
    SendMessageEvent event,
    Emitter<ConversationsState> emit,
  ) async {
    emit(SendMessageLoadingState());

    final res = await conversationsRepo.sendMessage(
      event.sendMessageParams,
    );

    res.fold(
      (l) => emit(SendMessageErrorState(message: l.message)),
      (r) => SendMessageSuccessState(),
    );
  }

  List<ConversationEntity> _conversations = [];
  List<ConversationEntity> get conversations => _conversations;

  StreamSubscription? _conversationsStream;

  _getConversations(
    GetConversationsEvent event,
    Emitter<ConversationsState> emit,
  ) {
    emit(GetConversationsLoadingState());

    final res = conversationsRepo.getConversations();

    res.fold(
      (l) => emit(GetConversationsErrorState(message: l.message)),
      (r) {
        _conversationsStream = r.listen((conversations) {
          add(UpdateConversationsEvent(conversations: conversations));
        });
      },
    );
  }

  _updateConversations(
    UpdateConversationsEvent event,
    Emitter<ConversationsState> emit,
  ) {
    _conversations = event.conversations;
    emit(GetConversationsSuccessState(conversations: conversations));
  }

  _checkIfConversationExist(
    CheckIfConversationExistEvent event,
    Emitter<ConversationsState> emit,
  ) async {
    final res = await conversationsRepo.checkIfConversationExist(
      event.participantId,
    );

    res.fold(
      (l) => emit(const ConversationExistsState(isExist: false)),
      (r) {
        if (r != null) {
          add(GetConversationMessagesEvent(conversationEntity: r));
        } else {
          _isInitialized = true;
          emit(GetConversationMessagesSuccessState(messages: messages));
        }
        // emit(ConversationExistsState(isExist: r != null));
      },
    );
  }

  List<MessageEntity> _messages = [];
  List<MessageEntity> get messages => _messages;

  StreamSubscription? _messagesStream;

  _getConversationMessages(
    GetConversationMessagesEvent event,
    Emitter<ConversationsState> emit,
  ) async {
    emit(GetConversationMessagesLoadingState());

    final res = await conversationsRepo.getConversationMessages(
      event.conversationEntity,
    );

    _isInitialized = true;

    res.fold(
      (l) => emit(GetConversationMessagesErrorState(message: l.message)),
      (r) {
        _messagesStream = r.listen((messages) {
          add(UpdateConversationMessagesEvent(messages: messages));
        });
      },
    );
  }

  _updateConversationMessages(
    UpdateConversationMessagesEvent event,
    Emitter<ConversationsState> emit,
  ) {
    _messages = event.messages;
    emit(GetConversationMessagesSuccessState(messages: messages));
  }

  ConversationEntity? _currentConversation;
  ConversationEntity? get currentConversation => _currentConversation;

  clearCurrentSession() {
    _currentConversation = null;
    _messages = [];
    _messagesStream?.cancel();
  }

  _clearCurrentSession(
    ClearCurrentSessionEvent event,
    Emitter<ConversationsState> emit,
  ) {
    clearCurrentSession();
    emit(CurrentSessionClearedState());
  }

  @override
  Future<void> close() {
    _conversationsStream?.cancel();
    _messagesStream?.cancel();
    return super.close();
  }
}
