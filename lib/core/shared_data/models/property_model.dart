import 'package:bns360_graduation_project/core/utils/enums/offer_type.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

import '../entities/property_entity.dart';
import 'contact_model.dart';
import 'publisher_details_model.dart';

class PropertyModel extends PropertyEntity {
  const PropertyModel({
    required super.id,
    required super.arabicDescription,
    required super.englishDescription,
    required super.arabicAddress,
    required super.englishAddress,
    required super.whatsappNumber,
    required super.publisher,
    required super.contacts,
    required super.type,
    required super.area,
    required super.price,
    required super.longitude,
    required super.latitude,
    required super.imageNames,
    required super.images,
    required super.timeAddedProperty,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'],
      arabicDescription: json['arabicDescription'],
      englishDescription: json['englishDescription'],
      arabicAddress: json['arabicAddress'],
      englishAddress: json['englishAddress'],
      whatsappNumber: json['whatsappNumber'],
      publisher: PublisherDetailsModel.fromJson(json['publisherDetails']),
      contacts: ContactModel.fromJson(json['contacts']),
      type: OfferType.fromId(json['type']),
      area: json['area'],
      price: json['price'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      imageNames: List<String>.from(
        json['imageNames'].map((e) => e["imageNames"]),
      ),
      images: const [],
      timeAddedProperty: DateTime.parse(json["timeAddedProperty"]),
    );
  }

  factory PropertyModel.fromEntity(PropertyEntity entity) {
    return PropertyModel(
      id: entity.id,
      arabicDescription: entity.arabicDescription,
      englishDescription: entity.englishDescription,
      arabicAddress: entity.arabicAddress,
      englishAddress: entity.englishAddress,
      whatsappNumber: entity.whatsappNumber,
      publisher: PublisherDetailsModel.fromEntity(entity.publisher),
      contacts: ContactModel.fromEntity(entity.contacts),
      type: entity.type,
      area: entity.area,
      price: entity.price,
      longitude: entity.longitude,
      latitude: entity.latitude,
      imageNames: entity.imageNames,
      images: entity.images,
      timeAddedProperty: entity.timeAddedProperty,
    );
  }

  Future<Map<String, dynamic>> toJson() async {
    final multiPartFiles = images.map((path) async {
      String fileName = basename(path);
      return await MultipartFile.fromFile(
        path,
        filename: fileName,
        contentType: MediaType('image', 'jpeg'),
      );
    }).toList();

    final encodedImages = await Future.wait(multiPartFiles);

    return {
      'arabicDescription': arabicDescription,
      'englishDescription': englishDescription,
      'arabicAddress': arabicAddress,
      'englishAddress': englishAddress,
      'whatsappNumber': whatsappNumber,
      'publisherDetails': PublisherDetailsModel.fromEntity(publisher).toJson(),
      'contacts': ContactModel.fromEntity(contacts).toJson(),
      'type': type.id.toString(),
      'area': area.toString(),
      'price': price.toString(),
      'longitude': longitude.toString(),
      'latitude': latitude.toString(),
      'imageNames': [],
      'images': encodedImages,
    };
  }
}
