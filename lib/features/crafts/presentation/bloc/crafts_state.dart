part of 'crafts_bloc.dart';

abstract class CraftsState extends Equatable {
  const CraftsState();

  @override
  List<Object> get props => [];
}

class CraftsInitial extends CraftsState {}

class GetCraftsmenLoadingState extends CraftsState {}

class GetCraftsmenSuccessState extends CraftsState {
  final List<CraftsmanEntity> craftsmen;

  const GetCraftsmenSuccessState({required this.craftsmen});
}

class GetCraftsmenErrorState extends CraftsState {
  final String message;

  const GetCraftsmenErrorState({required this.message});
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

  @override
  List<Object> get props => [isSearchEnabled];
}
