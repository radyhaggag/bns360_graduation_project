import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator/translator.dart';

import '../../../../core/shared_data/entities/job_entity.dart';
import '../../../../core/shared_data/entities/requirements_entity.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/extensions/language.dart';
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

    final searchLowercase = searchVal.toLowerCase();
    bool isTrue(String itemName) {
      final itemNameLowercase = itemName.toLowerCase();
      return searchLowercase.contains(itemNameLowercase) ||
          itemNameLowercase.contains(searchLowercase);
    }

    final filteredItems = jobs.where(
      (item) {
        return isTrue(item.jobTitleEnglish) ||
            isTrue(item.jobTitleArabic) ||
            isTrue(item.jobDescriptionArabic) ||
            isTrue(item.jobDescriptionEnglish);
      },
    ).toList();

    searchResults = filteredItems;
    emit(GetJobsSuccessState(jobs: filteredItems));
  }

  _getJobById(
    GetJobByIdEvent event,
    Emitter<JobsState> emit,
  ) async {
    emit(GetJobByIdLoadingState());

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
      requirements: requirementsAr,
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

    final jobEntity = event.jobEntity.copyWith(
      requirementEnglish: RequirementsEntity(requirements: requirementsAr),
      requirementsArabic: RequirementsEntity(requirements: requirementsAr),
    );

    final res = await jobsRepo.editJob(jobEntity);

    res.fold(
      (l) => emit(EditJobErrorState(message: l.message)),
      (r) => emit(EditJobSuccessState()),
    );
  }

  List<String> requirementsAr = [];
  List<String> requirementsEng = [];

  List<String> requirements(BuildContext context) {
    return context.currentLanguage == Language.arabic
        ? requirementsAr
        : requirementsEng;
  }

  _addRequirement(
    AddRequirementEvent event,
    Emitter<JobsState> emit,
  ) async {
    if (!event.withTranslation) {
      requirementsEng.add(event.requirement);
      requirementsAr.add(event.requirement);
    } else if (event.context.currentLanguage == Language.arabic) {
      final translation = await GoogleTranslator().translate(
        event.requirement,
        from: "ar",
        to: 'en',
      );

      requirementsEng.add(translation.text);
      requirementsAr.add(event.requirement);
    } else {
      final translation = await GoogleTranslator().translate(
        event.requirement,
        from: "en",
        to: 'ar',
      );

      requirementsEng.add(event.requirement);
      requirementsAr.add(translation.text);
    }
    emit(JobRequirementUpdatedState());
  }

  _removeRequirement(
    RemoveRequirementEvent event,
    Emitter<JobsState> emit,
  ) {
    requirementsAr.removeAt(event.index);
    requirementsEng.removeAt(event.index);
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
    requirementsAr = event.requirementsAr;
    requirementsEng = event.requirementsEng;
    emit(JobRequirementUpdatedState());
  }

  _editRequirement(
    EditRequirementEvent event,
    Emitter<JobsState> emit,
  ) async {
    if (event.context.currentLanguage == Language.arabic) {
      requirementsAr[event.index] = event.requirement;
    } else {
      requirementsEng[event.index] = event.requirement;
    }

    if (event.withTranslation) {
      final translation = event.context.currentLanguage == Language.arabic
          ? await GoogleTranslator().translate(
              event.requirement,
              from: "ar",
              to: 'en',
            )
          : await GoogleTranslator().translate(
              event.requirement,
              from: "en",
              to: 'ar',
            );

      if (event.context.currentLanguage == Language.arabic) {
        requirementsEng[event.index] = translation.text;
      } else {
        requirementsAr[event.index] = translation.text;
      }
    }
    emit(JobRequirementUpdatedState());
  }
}
