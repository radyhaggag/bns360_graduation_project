part of 'conversations_bloc.dart';

abstract class ConversationsState extends Equatable {
  const ConversationsState();

  @override
  List<Object> get props => [];
}

class ConversationsInitial extends ConversationsState {}

class SendMessageLoadingState extends ConversationsState {}

class SendMessageSuccessState extends ConversationsState {}

class SendMessageErrorState extends ConversationsState {
  final String message;

  const SendMessageErrorState({required this.message});
}

class GetConversationsLoadingState extends ConversationsState {}

class GetConversationsSuccessState extends ConversationsState {
  final List<ConversationEntity> conversations;

  const GetConversationsSuccessState({required this.conversations});
}

class GetConversationsErrorState extends ConversationsState {
  final String message;

  const GetConversationsErrorState({required this.message});
}

class ConversationExistsState extends ConversationsState {
  final bool isExist;

  const ConversationExistsState({required this.isExist});
}

class GetConversationMessagesLoadingState extends ConversationsState {}

class GetConversationMessagesSuccessState extends ConversationsState {
  final List<MessageEntity> messages;

  const GetConversationMessagesSuccessState({required this.messages});
}

class GetConversationMessagesErrorState extends ConversationsState {
  final String message;

  const GetConversationMessagesErrorState({required this.message});
}

class CurrentSessionClearedState extends ConversationsState {}
