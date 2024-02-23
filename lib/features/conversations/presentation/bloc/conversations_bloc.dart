import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/entities/conversation_entity.dart';
import '../../domain/entities/message_entity.dart';
import '../../domain/params/delete_message_params.dart';
import '../../domain/params/reset_unread_count_params.dart';
import '../../domain/params/send_message_params.dart';
import '../../domain/repositories/conversations_repo.dart';

part 'conversations_event.dart';
part 'conversations_state.dart';

class ConversationsBloc extends Bloc<ConversationsEvent, ConversationsState> {
  final ConversationsRepo conversationsRepo;

  ConversationsBloc({
    required this.conversationsRepo,
  }) : super(ConversationsInitial()) {
    initSearchListener();
    on<SendMessageEvent>(_sendMessage);
    on<GetConversationsEvent>(_getConversations);
    on<UpdateConversationsEvent>(_updateConversations);
    on<GetConversationMessagesEvent>(_getConversationMessages);
    on<UpdateConversationMessagesEvent>(_updateConversationMessages);
    on<ClearCurrentSessionEvent>(_clearCurrentSession);
    on<PicKMessageImageEvent>(_pickImage);
    on<RemovePickedImageEvent>(_removePickedImage);
    on<ResetCurrentUnreadCountEvent>(_resetUnreadCountForCurrentUser);
    on<DeleteMessageEvent>(_deleteMessage);
  }

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  bool get isMessagesEmpty => messages.isEmpty;

  _sendMessage(
    SendMessageEvent event,
    Emitter<ConversationsState> emit,
  ) async {
    SendMessageParams sendMessageParams = event.sendMessageParams;

    if ((sendMessageParams.content ?? "").isEmpty && pickedFile == null) {
      return;
    }
    emit(SendMessageLoadingState());

    sendMessageParams = sendMessageParams.copyWith(
      pickedFile: pickedFile,
    );

    final res = await conversationsRepo.sendMessage(
      sendMessageParams,
    );

    res.fold(
      (l) => emit(SendMessageErrorState(message: l.message)),
      (r) {
        _pickedFile = null;
        emit(SendMessageSuccessState());
      },
    );
  }

  List<ConversationEntity> _allConversations = [];
  List<ConversationEntity> _conversationsSearchResult = [];

  List<ConversationEntity> get conversations {
    if (searchController.text.isNotEmpty) {
      return _conversationsSearchResult;
    } else {
      return _allConversations;
    }
  }

  List<ConversationEntity> get sortedConversations {
    final temp = [...conversations];
    temp.sort(
      (a, b) => b.lastMessage.date.compareTo(a.lastMessage.date),
    );
    return temp;
  }

  bool get isSearchActive => searchController.text.isNotEmpty;

  StreamSubscription? _conversationsStream;

  _getConversations(
    GetConversationsEvent event,
    Emitter<ConversationsState> emit,
  ) async {
    emit(GetConversationsLoadingState());

    final res = conversationsRepo.getConversations();

    res.fold(
      (l) {
        _isInitialized = true;

        emit(GetConversationsErrorState(message: l.message));
      },
      (r) {
        _conversationsStream = r.listen((conversations) {
          _allConversations = conversations;
          add(UpdateConversationsEvent(conversations: conversations));
        });
      },
    );
  }

  _updateConversations(
    UpdateConversationsEvent event,
    Emitter<ConversationsState> emit,
  ) {
    if (!_isInitialized) _isInitialized = true;

    emit(GetConversationsSuccessState(conversations: conversations));
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
        emit(ConversationLoadedState());

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

  clearCurrentSession() {
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

  _resetUnreadCountForCurrentUser(
    ResetCurrentUnreadCountEvent event,
    Emitter<ConversationsState> emit,
  ) async {
    final params = ResetUnreadCountParams(
      otherParticipantId: event.otherParticipantId,
      otherParticipantType: event.otherParticipantType,
      numOfMessages: messages.length,
    );
    await conversationsRepo.resetUnreadCountForCurrentUser(params);
  }

  final searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  initSearchListener() {
    searchController.addListener(() {
      final value = searchController.text.toLowerCase();
      _conversationsSearchResult = _allConversations
          .where((conversation) => _searchConditions(conversation, value))
          .toList();
      add(UpdateConversationsEvent(conversations: _conversationsSearchResult));
    });
  }

  bool _searchConditions(ConversationEntity conversation, String value) {
    final nameAR = conversation.otherParticipant.nameAR?.toLowerCase();
    final nameEN = conversation.otherParticipant.nameEN?.toLowerCase();

    final containAR = nameAR?.contains(value);
    final containEN = nameEN?.contains(value);

    if ((containEN ?? false) || (containAR ?? false)) return true;
    if (identical(nameAR, value) || identical(nameEN, value)) return true;

    bool containARReversed = false;
    bool containENReversed = false;

    if (nameAR != null) containARReversed = value.contains(nameAR);
    if (nameEN != null) containENReversed = value.contains(nameEN);

    if ((containARReversed) || (containENReversed)) return true;

    if (identical(containARReversed, value) ||
        identical(containENReversed, value)) return true;

    return false;
  }

  @override
  Future<void> close() async {
    _conversationsStream?.cancel();
    _messagesStream?.cancel();
    searchController.dispose();
    scrollController.dispose();

    return super.close();
  }

  _deleteMessage(
    DeleteMessageEvent event,
    Emitter<ConversationsState> emit,
  ) async {
    await conversationsRepo.deleteMessage(
      event.deleteMessageParams,
    );
  }
}
