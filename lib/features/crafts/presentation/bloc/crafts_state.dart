part of 'crafts_bloc.dart';

abstract class CraftsState {
  const CraftsState();
}

class CraftsInitial extends CraftsState {}

class GetCraftItemsByIdLoadingState extends CraftsState {}

class GetCraftItemsByIdSuccessState extends CraftsState {
  final List<CraftsmanInfoEntity> craftsmen;

  const GetCraftItemsByIdSuccessState({required this.craftsmen});
}

class GetCraftItemsByIdErrorState extends CraftsState {
  final String message;

  const GetCraftItemsByIdErrorState({required this.message});
}

class GetCraftsLoadingState extends CraftsState {}

class GetCraftsSuccessState extends CraftsState {
  final List<CraftEntity> crafts;

  const GetCraftsSuccessState({required this.crafts});
}

class GetCraftsErrorState extends CraftsState {
  final String message;

  const GetCraftsErrorState({required this.message});
}

class SearchIconToggled extends CraftsState {
  final bool isSearchEnabled;

  const SearchIconToggled({required this.isSearchEnabled});
}
