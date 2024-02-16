import 'package:equatable/equatable.dart';

class MapParams extends Equatable {
  final String location;
  final double lat;
  final double lng;

  const MapParams({
    required this.location,
    required this.lat,
    required this.lng,
  });

  @override
  List<Object?> get props => [location, lat, lng];
}
