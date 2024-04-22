import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_data/entities/job_entity.dart';
import '../../domain/params/add_job_params.dart';
import '../../domain/repositories/jobs_repo.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final JobsRepo jobsRepo;

  JobsBloc({required this.jobsRepo}) : super(JobsInitial()) {
    on<GetJobsEvent>(_getJobs);
    on<GetJobByIdEvent>(_getJobById);
    on<SearchOnJobs>(_searchOnJobs);
    on<AddJobEvent>(_addJob);
    on<EditJobEvent>(_editJon);
    on<AddRequirementEvent>(_addRequirement);
    on<RemoveRequirementEvent>(_removeRequirement);
    on<EditRequirementEvent>(_editRequirement);
    on<InitJobRequirementsEvent>(_initJobRequirements);
  }

  List<JobEntity> jobs = [];
  List<JobEntity> searchResults = [];

  _getJobs(
    GetJobsEvent event,
    Emitter<JobsState> emit,
  ) async {
    emit(GetJobsLoadingState());
    await Future.delayed(const Duration(seconds: 1));

    final res = await jobsRepo.getJobs();

    res.fold(
      (l) => emit(GetJobsErrorState(message: l.message)),
      (r) {
        jobs = r;
        emit(GetJobsSuccessState(jobs: r));
      },
    );
  }

  bool isSearchEnabled = false;
  final searchController = TextEditingController();

  _searchOnJobs(
    SearchOnJobs event,
    Emitter<JobsState> emit,
  ) async {
    final searchVal = searchController.text.trim();
    if (searchVal.isEmpty) {
      isSearchEnabled = false;
      add(GetJobsEvent());
      return;
    }
    isSearchEnabled = true;

    emit(GetJobsLoadingState());
    await Future.delayed(const Duration(seconds: 1)); // TODO: FOR TEST

    final res = await jobsRepo.searchOnJobs(searchVal);

    res.fold(
      (l) {
        emit(GetJobsErrorState(message: l.message));
      },
      (r) {
        searchResults = r;
        emit(GetJobsSuccessState(jobs: r));
      },
    );
  }

  _getJobById(
    GetJobByIdEvent event,
    Emitter<JobsState> emit,
  ) async {
    emit(GetJobByIdLoadingState());
    await Future.delayed(const Duration(seconds: 1));

    final res = await jobsRepo.getJobById(event.id);

    res.fold(
      (l) => emit(GetJobByIdErrorState(message: l.message)),
      (r) {
        emit(GetJobByIdSuccessState(job: r));
      },
    );
  }

  _addJob(
    AddJobEvent event,
    Emitter<JobsState> emit,
  ) async {
    emit(AddJobLoadingState());

    final params = event.addJobParams.copyWith(
      requirements: requirements,
    );

    final res = await jobsRepo.addJob(params);

    res.fold(
      (l) => emit(AddJobErrorState(message: l.message)),
      (r) => emit(AddJobSuccessState()),
    );
  }

  _editJon(
    EditJobEvent event,
    Emitter<JobsState> emit,
  ) async {
    emit(EditJobLoadingState());

    final res = await jobsRepo.addJob(event.addJobParams);

    res.fold(
      (l) => emit(EditJobErrorState(message: l.message)),
      (r) => emit(EditJobSuccessState()),
    );
  }

  List<String> requirements = [];

  _addRequirement(
    AddRequirementEvent event,
    Emitter<JobsState> emit,
  ) {
    requirements.add(event.requirement);
    emit(JobRequirementUpdatedState());
  }

  _removeRequirement(
    RemoveRequirementEvent event,
    Emitter<JobsState> emit,
  ) {
    requirements.removeAt(event.index);
    emit(JobRequirementUpdatedState());
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }

  _initJobRequirements(
    InitJobRequirementsEvent event,
    Emitter<JobsState> emit,
  ) {
    requirements = event.requirements;
    emit(JobRequirementUpdatedState());
  }

  _editRequirement(
    EditRequirementEvent event,
    Emitter<JobsState> emit,
  ) {
    requirements[event.index] = event.requirement;
    emit(JobRequirementUpdatedState());
  }
}
