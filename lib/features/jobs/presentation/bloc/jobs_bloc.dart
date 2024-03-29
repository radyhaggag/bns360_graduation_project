import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/job_entity.dart';
import '../../domain/repositories/jobs_repo.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final JobsRepo jobsRepo;

  JobsBloc({required this.jobsRepo}) : super(JobsInitial()) {
    on<GetJobsEvent>(_getJobs);
    on<GetJobByIdEvent>(_getJobById);
    on<ToggleSearchIcon>(_toggleSearchIcon);
    on<SearchOnJobs>(_searchOnJobs);
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

  _toggleSearchIcon(
    ToggleSearchIcon event,
    Emitter<JobsState> emit,
  ) {
    isSearchEnabled = !isSearchEnabled;
    emit(SearchIconToggled(isSearchEnabled: isSearchEnabled));
    if (!isSearchEnabled && searchController.text.isNotEmpty) {
      searchController.clear();
      add(GetJobsEvent());
    }
  }

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

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
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
}
