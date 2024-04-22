import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_data/entities/job_entity.dart';
import '../../../../core/shared_data/entities/property_entity.dart';
import '../../domain/repositories/saved_repo.dart';

part 'saved_event.dart';
part 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final SavedRepo savedRepo;

  SavedBloc({required this.savedRepo}) : super(SavedInitial()) {
    on<GetSavedJobsEvent>(_getSavedJobs);
    on<GetSavedPropertiesEvent>(_getSavedProperties);
    on<ChangeCurrentView>(_changeCurrentView);
  }

  List<JobEntity> savedJobs = [];

  _getSavedJobs(
    GetSavedJobsEvent event,
    Emitter<SavedState> emit,
  ) async {
    if (savedJobs.isNotEmpty) return;

    emit(GetSavedJobsLoadingState());
    await Future.delayed(const Duration(seconds: 2)); // TODO: FOR TEST

    final res = await savedRepo.getSavedJobs();

    res.fold(
      (l) => emit(GetSavedJobsErrorState(message: l.message)),
      (r) {
        savedJobs = r;
        emit(GetSavedJobsSuccessState(saved: r));
      },
    );
  }

  List<PropertyEntity> savedProperties = [];

  _getSavedProperties(
    GetSavedPropertiesEvent event,
    Emitter<SavedState> emit,
  ) async {
    if (savedProperties.isNotEmpty) return;
    emit(GetSavedPropertiesLoadingState());
    await Future.delayed(const Duration(seconds: 2)); // TODO: FOR TEST

    final res = await savedRepo.getSavedProperties();

    res.fold(
      (l) => emit(GetSavedPropertiesErrorState(message: l.message)),
      (r) {
        savedProperties = r;
        emit(GetSavedPropertiesSuccessState(saved: r));
      },
    );
  }

  int activeTabIndex = 0;

  _changeCurrentView(
    ChangeCurrentView event,
    Emitter<SavedState> emit,
  ) {
    activeTabIndex = event.index;
    if (activeTabIndex == 0) {
      add(GetSavedJobsEvent());
    }
    if (activeTabIndex == 1) {
      add(GetSavedPropertiesEvent());
    }
    emit(CurrentViewChanged(index: activeTabIndex));
  }
}
