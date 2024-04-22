part of 'my_posts_bloc.dart';

abstract class MyPostsState extends Equatable {
  const MyPostsState();

  @override
  List<Object> get props => [];
}

class MyPostsInitial extends MyPostsState {}

class GetMyPostsJobsLoadingState extends MyPostsState {}

class GetMyPostsJobsSuccessState extends MyPostsState {
  final List<JobEntity> myPosts;

  const GetMyPostsJobsSuccessState({required this.myPosts});
}

class GetMyPostsJobsErrorState extends MyPostsState {
  final String message;

  const GetMyPostsJobsErrorState({required this.message});
}

class GetMyPostsPropertiesLoadingState extends MyPostsState {}

class GetMyPostsPropertiesSuccessState extends MyPostsState {
  final List<PropertyEntity> myPosts;

  const GetMyPostsPropertiesSuccessState({required this.myPosts});
}

class GetMyPostsPropertiesErrorState extends MyPostsState {
  final String message;

  const GetMyPostsPropertiesErrorState({required this.message});
}

class CurrentViewChangedState extends MyPostsState {
  final int index;

  const CurrentViewChangedState({required this.index});

  @override
  List<Object> get props => [index];
}

class PostsUpdatedState extends MyPostsState {}
