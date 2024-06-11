// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class MapParams extends Equatable {
  final String? location;
  final double? lat;
  final double? lng;

  final bool isMinimized;

  final void Function(double lat, double lng)? onTap;

  const MapParams({
    this.location,
    this.lat,
    this.lng,
    this.isMinimized = false,
    this.onTap,
  });

  @override
  List<Object?> get props => [location, lat, lng];

  MapParams copyWith({
    String? location,
    double? lat,
    double? lng,
    bool? isMinimized,
    void Function(double lat, double lng)? onTap,
  }) {
    return MapParams(
      location: location ?? this.location,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      isMinimized: isMinimized ?? this.isMinimized,
      onTap: onTap ?? this.onTap,
    );
  }
}
