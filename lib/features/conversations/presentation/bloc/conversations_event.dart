part of 'conversations_bloc.dart';

abstract class ConversationsEvent extends Equatable {
  const ConversationsEvent();

  @override
  List<Object> get props => [];
}

class SendMessageEvent extends ConversationsEvent {
  final SendMessageParams sendMessageParams;

  const SendMessageEvent({required this.sendMessageParams});

  @override
  List<Object> get props => [sendMessageParams];
}

class GetConversationsEvent extends ConversationsEvent {}

class UpdateConversationsEvent extends ConversationsEvent {
  final List<ConversationEntity> conversations;

  const UpdateConversationsEvent({required this.conversations});
}
