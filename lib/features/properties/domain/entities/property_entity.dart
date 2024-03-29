import 'package:equatable/equatable.dart';

import '../../../../core/shared_data/entities/profile/user_entity.dart';

class PropertyEntity extends Equatable {
  final String id;
  final UserEntity publisher;
  final num amount;
  final String description;
  final String date;
  final List<String> propertyImagesUrls;
  final String location;
  final double lat;
  final double lng;
  final num area;

  const PropertyEntity({
    required this.id,
    required this.description,
    required this.amount,
    required this.publisher,
    required this.date,
    required this.propertyImagesUrls,
    required this.location,
    required this.lat,
    required this.lng,
    required this.area,
  });

  @override
  List<Object> get props => [id, date, description, propertyImagesUrls];
}
