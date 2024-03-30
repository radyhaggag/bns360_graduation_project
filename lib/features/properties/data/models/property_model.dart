import 'package:bns360_graduation_project/core/utils/enums/offer_type.dart';

import '../../../../core/shared_data/models/profile/user_model.dart';
import '../../domain/entities/property_entity.dart';

class PropertyModel extends PropertyEntity {
  const PropertyModel({
    required super.id,
    required super.description,
    required super.price,
    required super.publisher,
    required super.date,
    required super.propertyImagesUrls,
    required super.address,
    required super.lat,
    required super.lng,
    required super.area,
    required super.offerType,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'],
      description: json['description'],
      price: json['price'],
      area: json['area'],
      lat: json['lat'],
      lng: json['lng'],
      date: json['date'],
      address: json['address'],
      offerType: OfferType.fromId(json['offerType']),
      propertyImagesUrls: json['propertyImagesUrls'] != null
          ? List<String>.from(json['propertyImagesUrls'])
          : [],
      publisher: UserModel.fromJson(json['publisher']),
    );
  }
}
