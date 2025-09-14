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

class EditPropertyLoadingState extends PropertiesState {}

class EditPropertySuccessState extends PropertiesState {
  const EditPropertySuccessState();
}

class EditPropertyErrorState extends PropertiesState {
  final String message;

  const EditPropertyErrorState({required this.message});
}

class PropertyImagesUpdatedState extends PropertiesState {}


class PropertyLocationSelectedState extends PropertiesState {
  final double lat;
  final double lng;

  const PropertyLocationSelectedState({
    required this.lat,
    required this.lng,
  });
}