part of 'jobs_bloc.dart';

abstract class JobsEvent {
  const JobsEvent();
}

class GetJobsEvent extends JobsEvent {}

class GetJobByIdEvent extends JobsEvent {
  final String id;

  const GetJobByIdEvent({required this.id});
}

class SearchOnJobs extends JobsEvent {}

class AddJobEvent extends JobsEvent {
  final AddJobParams addJobParams;

  const AddJobEvent({required this.addJobParams});
}

class EditJobEvent extends JobsEvent {
  final AddJobParams addJobParams;

  const EditJobEvent({required this.addJobParams});
}

class AddRequirementEvent extends JobsEvent {
  final String requirement;

  const AddRequirementEvent({required this.requirement});
}

class RemoveRequirementEvent extends JobsEvent {
  final int index;

  const RemoveRequirementEvent({required this.index});
}

class EditRequirementEvent extends JobsEvent {
  final String requirement;
  final int index;

  const EditRequirementEvent({
    required this.requirement,
    required this.index,
  });
}

class InitJobRequirementsEvent extends JobsEvent {
  final List<String> requirements;

  const InitJobRequirementsEvent({required this.requirements});
}
