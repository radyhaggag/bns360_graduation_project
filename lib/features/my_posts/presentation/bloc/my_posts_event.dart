part of 'my_posts_bloc.dart';

abstract class MyPostsEvent extends Equatable {
  const MyPostsEvent();

  @override
  List<Object> get props => [];
}

class GetMyPostsJobsEvent extends MyPostsEvent {}

class GetMyPostsPropertiesEvent extends MyPostsEvent {}

class ChangeCurrentView extends MyPostsEvent {
  final int index;

  const ChangeCurrentView({required this.index});

  @override
  List<Object> get props => [index];
}

class DeletePostEvent extends MyPostsEvent {
  final bool isJob;
  final int index;
  final int itemId;

  const DeletePostEvent({
    required this.isJob,
    required this.index,
    required this.itemId,
  });
}
