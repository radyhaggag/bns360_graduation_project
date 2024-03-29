part of 'properties_bloc.dart';

abstract class PropertiesEvent extends Equatable {
  const PropertiesEvent();

  @override
  List<Object> get props => [];
}

class GetPropertiesEvent extends PropertiesEvent {}

class GetPropertyByIdEvent extends PropertiesEvent {
  final String id;

  const GetPropertyByIdEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class SearchOnProperties extends PropertiesEvent {}
