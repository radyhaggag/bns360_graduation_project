part of 'crafts_bloc.dart';

abstract class CraftsEvent {
  const CraftsEvent();
}

class GetCraftsEvent extends CraftsEvent {}

class GetCraftItemsByIdEvent extends CraftsEvent {
  final int id;

  const GetCraftItemsByIdEvent({required this.id});
}

class ToggleSearchIcon extends CraftsEvent {}

class SearchOnCrafts extends CraftsEvent {}
