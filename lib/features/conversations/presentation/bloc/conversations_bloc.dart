import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/conversation_entity.dart';
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
  }

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

  @override
  Future<void> close() {
    _conversationsStream?.cancel();
    return super.close();
  }
}
