part of 'jobs_bloc.dart';

abstract class JobsState {
  const JobsState();
}

class JobsInitial extends JobsState {}

class GetJobsLoadingState extends JobsState {}

class GetJobsSuccessState extends JobsState {
  final List<JobEntity> jobs;

  const GetJobsSuccessState({required this.jobs});
}

class GetJobsErrorState extends JobsState {
  final String message;

  const GetJobsErrorState({required this.message});
}

class GetJobByIdLoadingState extends JobsState {}

class GetJobByIdSuccessState extends JobsState {
  final JobEntity job;

  const GetJobByIdSuccessState({required this.job});
}

class GetJobByIdErrorState extends JobsState {
  final String message;

  const GetJobByIdErrorState({required this.message});
}

class SearchIconToggled extends JobsState {
  final bool isSearchEnabled;

  const SearchIconToggled({required this.isSearchEnabled});
}

class AddJobLoadingState extends JobsState {}

class AddJobSuccessState extends JobsState {}

class AddJobErrorState extends JobsState {
  final String message;

  const AddJobErrorState({required this.message});
}

class EditJobLoadingState extends JobsState {}

class EditJobSuccessState extends JobsState {}

class EditJobErrorState extends JobsState {
  final String message;

  const EditJobErrorState({required this.message});
}

class JobRequirementUpdatedState extends JobsState {}
