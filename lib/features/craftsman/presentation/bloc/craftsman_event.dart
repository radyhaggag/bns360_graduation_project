part of 'craftsman_bloc.dart';

abstract class CraftsmanEvent {
  const CraftsmanEvent();
}

class GetCraftsmanReviewsEvent extends CraftsmanEvent {
  final int itemId;

  const GetCraftsmanReviewsEvent({required this.itemId});
}

class GetCraftsmanReviewSummaryEvent extends CraftsmanEvent {
  final int itemId;

  const GetCraftsmanReviewSummaryEvent({required this.itemId});
}

class GetCraftsmanEvent extends CraftsmanEvent {
  final int itemId;

  const GetCraftsmanEvent({required this.itemId});
}

class SetCraftsmanEntityEvent extends CraftsmanEvent {
  final CraftsmanEntity craftsmanEntity;

  const SetCraftsmanEntityEvent({required this.craftsmanEntity});
}

class SendCraftsmanReviewEvent extends CraftsmanEvent {
  final int itemId;
  final double rating;
  final String review;

  const SendCraftsmanReviewEvent({
    required this.itemId,
    required this.rating,
    required this.review,
  });
}

class RemoveCraftsmanReviewEvent extends CraftsmanEvent {
  final int reviewId;
  final int craftsmanId;

  const RemoveCraftsmanReviewEvent({
    required this.reviewId,
    required this.craftsmanId,
  });
}
