part of 'chatbot_bloc.dart';

abstract class ChatbotState extends Equatable {
  const ChatbotState();

  @override
  List<Object> get props => [];
}

class ChatbotInitial extends ChatbotState {}

class SendChatbotMessageLoadingState extends ChatbotState {}

class SendChatbotMessageSuccessState extends ChatbotState {}

class SendChatbotMessageErrorState extends ChatbotState {
  final String message;

  const SendChatbotMessageErrorState({required this.message});
}

class GetChatbotMessagesLoadingState extends ChatbotState {}

class GetChatbotMessagesSuccessState extends ChatbotState {
  final List<MessageEntity> messages;
  final bool scrollToDown;

  const GetChatbotMessagesSuccessState({
    required this.messages,
    this.scrollToDown = false,
  });
}

class GetChatbotMessagesErrorState extends ChatbotState {
  final String message;

  const GetChatbotMessagesErrorState({required this.message});
}

