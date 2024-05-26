import 'package:bns360_graduation_project/core/databases/local_storage/hive_manager.dart';
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
    on<SaveJobEvent>(_saveJob);
    on<SavePropertyEvent>(_saveProperty);
    on<UnSaveJobEvent>(_unSaveJob);
    on<UnSavePropertyEvent>(_unSaveProperty);
  }

  List<JobEntity> savedJobs = [];
  List<PropertyEntity> savedProperties = [];

  List<int> get savedJobInLocalIds {
    return HiveBoxes.savedJobs.values.toList();
  }

  List<int> get savedPropertiesInLocalIds {
    return HiveBoxes.savedProperties.values.toList();
  }

  _getSavedJobs(
    GetSavedJobsEvent event,
    Emitter<SavedState> emit,
  ) async {
    if (savedJobs.length == savedJobInLocalIds.length) return;
    emit(GetSavedJobsLoadingState());

    final res = await savedRepo.getSavedJobs();

    res.fold(
      (l) => emit(GetSavedJobsErrorState(message: l.message)),
      (r) {
        savedJobs = r;
        emit(GetSavedJobsSuccessState(saved: r));
      },
    );
  }

  _getSavedProperties(
    GetSavedPropertiesEvent event,
    Emitter<SavedState> emit,
  ) async {
    if (savedProperties.length == savedPropertiesInLocalIds.length) return;
    emit(GetSavedPropertiesLoadingState());

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
    if (activeTabIndex == event.index) return;
    activeTabIndex = event.index;
    if (activeTabIndex == 0) {
      add(GetSavedPropertiesEvent());
    }
    if (activeTabIndex == 1) {
      add(GetSavedJobsEvent());
    }
    emit(CurrentViewChanged(index: activeTabIndex));
  }

  _saveJob(SaveJobEvent event, Emitter<SavedState> emit) async {
    emit(SaveJobLoadingState(jobId: event.jobId));

    final res = await savedRepo.saveJob(event.jobId);

    res.fold(
      (l) => emit(SaveJobErrorState(
        message: l.message,
        jobId: event.jobId,
      )),
      (r) => emit(SaveJobSuccessState(
        jobId: event.jobId,
      )),
    );
  }

  _saveProperty(SavePropertyEvent event, Emitter<SavedState> emit) async {
    emit(SavePropertyLoadingState(propertyId: event.propertyId));

    final res = await savedRepo.saveProperty(event.propertyId);

    res.fold(
      (l) => emit(SavePropertyErrorState(
        message: l.message,
        propertyId: event.propertyId,
      )),
      (r) => emit(SavePropertySuccessState(
        propertyId: event.propertyId,
      )),
    );
  }

  _unSaveJob(UnSaveJobEvent event, Emitter<SavedState> emit) async {
    emit(UnSaveJobLoadingState(jobId: event.jobId));

    final res = await savedRepo.unSaveJob(event.jobId);

    res.fold(
      (l) => emit(UnSaveJobErrorState(
        message: l.message,
        jobId: event.jobId,
      )),
      (r) {
        savedJobs.removeWhere((element) => element.id == event.jobId);
        emit(UnSaveJobSuccessState(
          jobId: event.jobId,
        ));
      },
    );
  }

  _unSaveProperty(UnSavePropertyEvent event, Emitter<SavedState> emit) async {
    emit(UnSavePropertyLoadingState(propertyId: event.propertyId));

    final res = await savedRepo.unSaveProperty(event.propertyId);

    res.fold(
      (l) => emit(UnSavePropertyErrorState(
        message: l.message,
        propertyId: event.propertyId,
      )),
      (r) {
        savedProperties.removeWhere(
          (element) => element.id == event.propertyId,
        );
        emit(UnSavePropertySuccessState(
          propertyId: event.propertyId,
        ));
      },
    );
  }
}
