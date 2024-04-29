part of 'crafts_bloc.dart';

abstract class CraftsEvent extends Equatable {
  const CraftsEvent();

  @override
  List<Object> get props => [];
}

class GetCraftsmenEvent extends CraftsEvent {}

class GetCraftsEvent extends CraftsEvent {}

class GetCraftItemsByIdEvent extends CraftsEvent {
  final String id;

  const GetCraftItemsByIdEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class ToggleSearchIcon extends CraftsEvent {}

class SearchOnCrafts extends CraftsEvent {}
