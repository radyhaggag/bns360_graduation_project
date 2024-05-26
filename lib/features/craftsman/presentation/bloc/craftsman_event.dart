part of 'craftsman_bloc.dart';

abstract class CraftsmanEvent extends Equatable {
  const CraftsmanEvent();

  @override
  List<Object> get props => [];
}

class GetCraftsmanReviewsEvent extends CraftsmanEvent {
  final int itemId;

  const GetCraftsmanReviewsEvent({required this.itemId});
}

class RemoveCraftsmanReviewEvent extends CraftsmanEvent {
  final int itemId;
  final int reviewId;

  const RemoveCraftsmanReviewEvent({
    required this.itemId,
    required this.reviewId,
  });
}
