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
  final JobEntity jobEntity;

  const EditJobEvent({required this.jobEntity});
}

class AddRequirementEvent extends JobsEvent {
  final String requirement;
  final bool withTranslation;
  final BuildContext context;

  const AddRequirementEvent({
    required this.requirement,
    required this.context,
    this.withTranslation = false,
  });
}

class RemoveRequirementEvent extends JobsEvent {
  final int index;

  const RemoveRequirementEvent({required this.index});
}

class EditRequirementEvent extends JobsEvent {
  final String requirement;
  final BuildContext context;
  final int index;
  final bool withTranslation;

  const EditRequirementEvent({
    required this.requirement,
    required this.context,
    required this.index,
    this.withTranslation = false,
  });
}

class InitJobRequirementsEvent extends JobsEvent {
  final List<String> requirementsEng;
  final List<String> requirementsAr;

  const InitJobRequirementsEvent({
    required this.requirementsAr,
    required this.requirementsEng,
  });
}
