part of 'craftsman_bloc.dart';

abstract class CraftsmanEvent extends Equatable {
  const CraftsmanEvent();

  @override
  List<Object> get props => [];
}

class GetCraftsmanReviewsEvent extends CraftsmanEvent {
  final String itemId;

  const GetCraftsmanReviewsEvent({required this.itemId});
}
