part of 'saved_bloc.dart';

abstract class SavedState extends Equatable {
  const SavedState();

  @override
  List<Object> get props => [];
}

class SavedInitial extends SavedState {}

class GetSavedJobsLoadingState extends SavedState {}

class GetSavedJobsSuccessState extends SavedState {
  final List<JobEntity> saved;

  const GetSavedJobsSuccessState({required this.saved});
}

class GetSavedJobsErrorState extends SavedState {
  final String message;

  const GetSavedJobsErrorState({required this.message});
}

class GetSavedPropertiesLoadingState extends SavedState {}

class GetSavedPropertiesSuccessState extends SavedState {
  final List<PropertyEntity> saved;

  const GetSavedPropertiesSuccessState({required this.saved});
}

class GetSavedPropertiesErrorState extends SavedState {
  final String message;

  const GetSavedPropertiesErrorState({required this.message});
}

class CurrentViewChanged extends SavedState {
  final int index;

  const CurrentViewChanged({required this.index});

  @override
  List<Object> get props => [index];
}
