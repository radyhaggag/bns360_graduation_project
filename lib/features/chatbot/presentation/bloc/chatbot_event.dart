part of 'chatbot_bloc.dart';

abstract class ChatbotEvent extends Equatable {
  const ChatbotEvent();

  @override
  List<Object> get props => [];
}

class ChatbotSendMessage extends ChatbotEvent {
  final String message;

  const ChatbotSendMessage(this.message);

  @override
  List<Object> get props => [message];
}

class ChatbotGetMessages extends ChatbotEvent {}

class UpdateChatbotMessagesEvent extends ChatbotEvent {
  final List<MessageEntity> messages;
  final bool scrollToDown;

  const UpdateChatbotMessagesEvent({
    required this.messages,
    this.scrollToDown = false,
  });

  @override
  List<Object> get props => [messages, scrollToDown];
}


class SendChatbotMessageEvent extends ChatbotEvent {
  final String message;

  const SendChatbotMessageEvent(this.message);

  @override
  List<Object> get props => [message];
}