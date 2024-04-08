part of 'properties_bloc.dart';

abstract class PropertiesEvent {
  const PropertiesEvent();
}

class GetPropertiesEvent extends PropertiesEvent {}

class GetPropertyByIdEvent extends PropertiesEvent {
  final String id;

  const GetPropertyByIdEvent({required this.id});
}

class SearchOnPropertiesEvent extends PropertiesEvent {}

class SelectPropertyLocationEvent extends PropertiesEvent {
  final double lat;
  final double lng;

  const SelectPropertyLocationEvent({
    required this.lat,
    required this.lng,
  });
}

class AddPropertyEvent extends PropertiesEvent {
  final AddPropertyParams addPropertyParams;

  const AddPropertyEvent({
    required this.addPropertyParams,
  });
}

class PickPropertyImagesEvent extends PropertiesEvent {}

class RemovePickedPropertyImagesEvent extends PropertiesEvent {}
