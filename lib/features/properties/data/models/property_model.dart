import '../../../../core/shared_data/models/profile/user_model.dart';
import '../../domain/entities/property_entity.dart';

class PropertyModel extends PropertyEntity {
  const PropertyModel({
    required super.id,
    required super.description,
    required super.amount,
    required super.publisher,
    required super.date,
    required super.propertyImagesUrls,
    required super.location,
    required super.lat,
    required super.lng,
    required super.area,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'],
      description: json['description'],
      amount: json['amount'],
      area: json['area'],
      lat: json['lat'],
      lng: json['lng'],
      date: json['date'],
      location: json['location'],
      propertyImagesUrls: json['propertyImagesUrls'] != null
          ? List<String>.from(json['propertyImagesUrls'])
          : [],
      publisher: UserModel.fromJson(json['publisher']),
    );
  }
}
