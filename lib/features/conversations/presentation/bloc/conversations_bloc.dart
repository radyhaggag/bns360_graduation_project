import 'dart:async';
import 'dart:io';

import 'package:bns360_graduation_project/core/utils/main_logger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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
    on<PicKMessageImageEvent>(_pickImage);
    on<RemovePickedImageEvent>(_removePickedImage);
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
      (r) {
        emit(SendMessageSuccessState());
      },
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
          add(GetConversationMessagesEvent(conversationId: r.id));
        } else {
          _isInitialized = true;
          _currentConversation = r;
          emit(GetConversationMessagesSuccessState(messages: messages));
        }
        // emit(ConversationExistsState(isExist: r != null));
      },
    );
  }

  List<MessageEntity> _messages = [];
  List<MessageEntity> get messages => _messages;

  StreamSubscription<List<MessageEntity>>? _messagesStream;
  Stream<List<MessageEntity>>? messagesStream;

  _getConversationMessages(
    GetConversationMessagesEvent event,
    Emitter<ConversationsState> emit,
  ) async {
    emit(GetConversationMessagesLoadingState());

    final res = await conversationsRepo.getConversationMessages(
      event.conversationId,
    );

    res.fold(
      (l) {
        _isInitialized = true;
        emit(GetConversationMessagesErrorState(message: l.message));
      },
      (r) {
        messagesStream = r;

        _messagesStream = r.listen((messages) {
          _isInitialized = true;
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

  File? _pickedFile;
  File? get pickedFile => _pickedFile;

  @override
  Future<void> close() async {
    _conversationsStream?.cancel();
    _messagesStream?.cancel();
    await _resetUnreadCountForCurrentUser();

    return super.close();
  }

  _pickImage(
    PicKMessageImageEvent event,
    Emitter<ConversationsState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();

    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _pickedFile = File(image.path);
      emit(MessageImagePickedSuccessState());
    }
  }

  _removePickedImage(
    RemovePickedImageEvent event,
    Emitter<ConversationsState> emit,
  ) {
    _pickedFile = null;
    emit(MessagePickedImageRemovedSuccessState());
  }

  _resetUnreadCountForCurrentUser() {
    if (currentConversation == null) return;
    conversationsRepo.resetUnreadCountForCurrentUser(currentConversation!);
    logger.i("Unread count reset done for ${currentConversation?.id}");
  }
}
