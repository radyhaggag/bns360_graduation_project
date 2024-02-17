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
