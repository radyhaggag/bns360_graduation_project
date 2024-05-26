import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_data/entities/job_entity.dart';
import '../../../../core/shared_data/entities/property_entity.dart';
import '../../domain/repositories/my_posts_repo.dart';

part 'my_posts_event.dart';
part 'my_posts_state.dart';

class MyPostsBloc extends Bloc<MyPostsEvent, MyPostsState> {
  final MyPostsRepo myPostsRepo;

  MyPostsBloc({required this.myPostsRepo}) : super(MyPostsInitial()) {
    on<GetMyPostsJobsEvent>(_getMyPostsJobs);
    on<GetMyPostsPropertiesEvent>(_getMyPostsProperties);
    on<ChangeCurrentView>(_changeCurrentView);
    on<DeletePostEvent>(_deletePostEvent);
  }

  List<JobEntity> myPostsJobs = [];

  _getMyPostsJobs(
    GetMyPostsJobsEvent event,
    Emitter<MyPostsState> emit,
  ) async {
    if (myPostsJobs.isNotEmpty) return;

    emit(GetMyPostsJobsLoadingState());

    final res = await myPostsRepo.getMyPostsJobs();

    res.fold(
      (l) => emit(GetMyPostsJobsErrorState(message: l.message)),
      (r) {
        myPostsJobs = r;
        emit(GetMyPostsJobsSuccessState(myPosts: r));
      },
    );
  }

  List<PropertyEntity> myPostsProperties = [];

  _getMyPostsProperties(
    GetMyPostsPropertiesEvent event,
    Emitter<MyPostsState> emit,
  ) async {
    if (myPostsProperties.isNotEmpty) return;
    emit(GetMyPostsPropertiesLoadingState());

    final res = await myPostsRepo.getMyPostsProperties();

    res.fold(
      (l) => emit(GetMyPostsPropertiesErrorState(message: l.message)),
      (r) {
        myPostsProperties = r;
        emit(GetMyPostsPropertiesSuccessState(myPosts: r));
      },
    );
  }

  int activeTabIndex = 0;

  _changeCurrentView(
    ChangeCurrentView event,
    Emitter<MyPostsState> emit,
  ) {
    if(event.index == activeTabIndex) return;
    activeTabIndex = event.index;
    if (activeTabIndex == 1) {
      add(GetMyPostsJobsEvent());
    }
    if (activeTabIndex == 0) {
      add(GetMyPostsPropertiesEvent());
    }
    emit(CurrentViewChangedState(index: activeTabIndex));
  }

  _deletePostEvent(
    DeletePostEvent event,
    Emitter<MyPostsState> emit,
  ) {
    if (event.isJob) {
      myPostsJobs.removeAt(event.index);
    } else {
      myPostsProperties.removeAt(event.index);
    }
    emit(PostsUpdatedState());
  }
}
