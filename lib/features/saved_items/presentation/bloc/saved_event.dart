part of 'saved_bloc.dart';

abstract class SavedEvent extends Equatable {
  const SavedEvent();

  @override
  List<Object> get props => [];
}

class GetSavedJobsEvent extends SavedEvent {}

class GetSavedPropertiesEvent extends SavedEvent {}

class ChangeCurrentView extends SavedEvent {
  final int index;

  const ChangeCurrentView({required this.index});

  @override
  List<Object> get props => [index];
}
