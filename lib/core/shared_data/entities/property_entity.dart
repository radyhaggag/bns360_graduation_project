import 'package:equatable/equatable.dart';

import '../../utils/enums/offer_type.dart';
import 'profile/user_entity.dart';

class PropertyEntity extends Equatable {
  final String id;
  final UserEntity publisher;
  final num price;
  final String description;
  final String date;
  final List<String> propertyImagesUrls;
  final String address;
  final double lat;
  final double lng;
  final String area;
  final OfferType offerType;
  final String? phoneNumber;
  final String? whatsapp;

  const PropertyEntity({
    required this.id,
    required this.description,
    required this.price,
    required this.publisher,
    required this.date,
    required this.propertyImagesUrls,
    required this.address,
    required this.lat,
    required this.lng,
    required this.area,
    required this.offerType,
    this.phoneNumber,
    this.whatsapp,
  });

  @override
  List<Object> get props => [id, date, description, propertyImagesUrls];
}
