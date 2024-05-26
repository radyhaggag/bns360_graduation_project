part of 'saved_bloc.dart';

abstract class SavedState {}

class SavedInitial extends SavedState {}

class GetSavedJobsLoadingState extends SavedState {}

class GetSavedJobsSuccessState extends SavedState {
  final List<JobEntity> saved;

  GetSavedJobsSuccessState({required this.saved});
}

class GetSavedJobsErrorState extends SavedState {
  final String message;

  GetSavedJobsErrorState({required this.message});
}

class GetSavedPropertiesLoadingState extends SavedState {}

class GetSavedPropertiesSuccessState extends SavedState {
  final List<PropertyEntity> saved;

  GetSavedPropertiesSuccessState({required this.saved});
}

class GetSavedPropertiesErrorState extends SavedState {
  final String message;

  GetSavedPropertiesErrorState({required this.message});
}

class CurrentViewChanged extends SavedState {
  final int index;

  CurrentViewChanged({required this.index});
}

class SaveJobLoadingState extends SavedState {
  final int jobId;

  SaveJobLoadingState({required this.jobId});
}

class SaveJobSuccessState extends SavedState {
  final int jobId;

  SaveJobSuccessState({required this.jobId});
}

class SaveJobErrorState extends SavedState {
  final String message;
  final int jobId;

  SaveJobErrorState({
    required this.message,
    required this.jobId,
  });
}

class SavePropertyLoadingState extends SavedState {
  final int propertyId;

  SavePropertyLoadingState({required this.propertyId});
}

class SavePropertySuccessState extends SavedState {
  final int propertyId;

  SavePropertySuccessState({required this.propertyId});
}

class SavePropertyErrorState extends SavedState {
  final String message;
  final int propertyId;

  SavePropertyErrorState({
    required this.message,
    required this.propertyId,
  });
}

class UnSaveJobLoadingState extends SavedState {
  final int jobId;

  UnSaveJobLoadingState({required this.jobId});
}

class UnSaveJobSuccessState extends SavedState {
  final int jobId;

  UnSaveJobSuccessState({required this.jobId});
}

class UnSaveJobErrorState extends SavedState {
  final String message;
  final int jobId;

  UnSaveJobErrorState({required this.message, required this.jobId});
}

class UnSavePropertyLoadingState extends SavedState {
  final int propertyId;

  UnSavePropertyLoadingState({required this.propertyId});
}

class UnSavePropertySuccessState extends SavedState {
  final int propertyId;

  UnSavePropertySuccessState({required this.propertyId});
}

class UnSavePropertyErrorState extends SavedState {
  final String message;
  final int propertyId;

  UnSavePropertyErrorState({
    required this.message,
    required this.propertyId,
  });
}
