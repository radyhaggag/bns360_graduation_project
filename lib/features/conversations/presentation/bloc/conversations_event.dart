part of 'conversations_bloc.dart';

abstract class ConversationsEvent {
  const ConversationsEvent();
}

class SendMessageEvent extends ConversationsEvent {
  final SendMessageParams sendMessageParams;

  const SendMessageEvent({
    required this.sendMessageParams,
  });
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

class PicKMessageImageEvent extends ConversationsEvent {}

class RemovePickedImageEvent extends ConversationsEvent {}

class ResetCurrentUnreadCountEvent extends ConversationsEvent {
  final String otherParticipantId;
  final int otherParticipantType;
  final String conversationId;
  

  ResetCurrentUnreadCountEvent({
    required this.otherParticipantId,
    required this.otherParticipantType,
    required this.conversationId,
  });
}

class DeleteMessageEvent extends ConversationsEvent {
  final DeleteMessageParams deleteMessageParams;

  DeleteMessageEvent({
    required this.deleteMessageParams,
  });
}

class SetCurrentParticipantEvent extends ConversationsEvent {
  final ParticipantEntity participantEntity;

  SetCurrentParticipantEvent({
    required this.participantEntity,
  });
}
