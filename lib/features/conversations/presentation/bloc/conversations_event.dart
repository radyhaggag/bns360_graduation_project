part of 'conversations_bloc.dart';

abstract class ConversationsEvent extends Equatable {
  const ConversationsEvent();

  @override
  List<Object> get props => [];
}

class SendMessageEvent extends ConversationsEvent {
  final SendMessageParams sendMessageParams;

  const SendMessageEvent({
    required this.sendMessageParams,
  });

  @override
  List<Object> get props => [sendMessageParams];
}

class GetConversationsEvent extends ConversationsEvent {}

class UpdateConversationsEvent extends ConversationsEvent {
  final List<ConversationEntity> conversations;

  const UpdateConversationsEvent({required this.conversations});
}

class CheckIfConversationExistEvent extends ConversationsEvent {
  final String participantId;

  const CheckIfConversationExistEvent({required this.participantId});
}

class GetConversationMessagesEvent extends ConversationsEvent {
  final String conversationId;

  const GetConversationMessagesEvent({required this.conversationId});
}

class UpdateConversationMessagesEvent extends ConversationsEvent {
  final List<MessageEntity> messages;

  const UpdateConversationMessagesEvent({required this.messages});
}

class ClearCurrentSessionEvent extends ConversationsEvent {}
