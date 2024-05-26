part of 'saved_bloc.dart';

abstract class SavedEvent {}

class GetSavedJobsEvent extends SavedEvent {}

class GetSavedPropertiesEvent extends SavedEvent {}

class ChangeCurrentView extends SavedEvent {
  final int index;

  ChangeCurrentView({required this.index});
}

class SaveJobEvent extends SavedEvent {
  final int jobId;

  SaveJobEvent({required this.jobId});
}

class SavePropertyEvent extends SavedEvent {
  final int propertyId;

  SavePropertyEvent({required this.propertyId});
}

class UnSaveJobEvent extends SavedEvent {
  final int jobId;

  UnSaveJobEvent({required this.jobId});
}

class UnSavePropertyEvent extends SavedEvent {
  final int propertyId;

  UnSavePropertyEvent({required this.propertyId});
}
