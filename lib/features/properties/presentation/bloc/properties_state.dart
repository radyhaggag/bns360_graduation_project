part of 'properties_bloc.dart';

abstract class PropertiesState extends Equatable {
  const PropertiesState();

  @override
  List<Object> get props => [];
}

class PropertiesInitial extends PropertiesState {}

class GetPropertiesLoadingState extends PropertiesState {}

class GetPropertiesSuccessState extends PropertiesState {
  final List<PropertyEntity> properties;

  const GetPropertiesSuccessState({required this.properties});
}

class GetPropertiesErrorState extends PropertiesState {
  final String message;

  const GetPropertiesErrorState({required this.message});
}

class GetPropertyByIdLoadingState extends PropertiesState {}

class GetPropertyByIdSuccessState extends PropertiesState {
  final PropertyEntity property;

  const GetPropertyByIdSuccessState({required this.property});
}

class GetPropertyByIdErrorState extends PropertiesState {
  final String message;

  const GetPropertyByIdErrorState({required this.message});
}

class SearchIconToggled extends PropertiesState {
  final bool isSearchEnabled;

  const SearchIconToggled({required this.isSearchEnabled});

  @override
  List<Object> get props => [isSearchEnabled];
}
