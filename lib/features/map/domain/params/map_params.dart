import 'package:equatable/equatable.dart';

class MapParams extends Equatable {
  final String location;
  final double lat;
  final double lng;

  final void Function(double lat, double lng)? onTap;

  const MapParams({
    required this.location,
    required this.lat,
    required this.lng,
    this.onTap,
  });

  @override
  List<Object?> get props => [location, lat, lng];
}
