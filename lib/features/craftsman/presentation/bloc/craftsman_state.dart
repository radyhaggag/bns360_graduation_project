part of 'craftsman_bloc.dart';

abstract class CraftsmanState extends Equatable {
  const CraftsmanState();

  @override
  List<Object> get props => [];
}

class CraftsmanInitial extends CraftsmanState {}

class GetCraftsmanReviewsLoadingState extends CraftsmanState {}

class GetCraftsmanReviewsSuccessState extends CraftsmanState {
  final List<ReviewEntity> reviews;

  const GetCraftsmanReviewsSuccessState({required this.reviews});
}

class GetCraftsmanReviewsErrorState extends CraftsmanState {
  final String message;

  const GetCraftsmanReviewsErrorState({required this.message});
}

class RemoveCraftsmanReviewLoadingState extends CraftsmanState {}

class RemoveCraftsmanReviewSuccessState extends CraftsmanState {}

class RemoveCraftsmanReviewErrorState extends CraftsmanState {
  final String message;

  const RemoveCraftsmanReviewErrorState({required this.message});
}