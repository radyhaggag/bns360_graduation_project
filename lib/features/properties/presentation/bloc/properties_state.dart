part of 'properties_bloc.dart';

abstract class PropertiesState {
  const PropertiesState();
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
}

class AddPropertyLoadingState extends PropertiesState {}

class AddPropertySuccessState extends PropertiesState {
  const AddPropertySuccessState();
}

class AddPropertyErrorState extends PropertiesState {
  final String message;

  const AddPropertyErrorState({required this.message});
}

class PropertyImagesUpdatedState extends PropertiesState {}
