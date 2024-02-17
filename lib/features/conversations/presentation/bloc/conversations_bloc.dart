import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
}
