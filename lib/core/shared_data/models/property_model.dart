import 'package:bns360_graduation_project/core/providers/app_provider.dart';

import '../../helpers/api_images_helper.dart';
import '../../utils/enums/offer_type.dart';
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
    required super.publisher,
    required super.contacts,
    required super.type,
    required super.area,
    required super.price,
    required super.longitude,
    required super.latitude,
    required super.timeAddedProperty,
    super.image1,
    super.image2,
    super.image3,
    super.image4,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['Id'],
      arabicDescription: json['ArabicDescription'],
      englishDescription: json['EnglishDescription'],
      arabicAddress: json['ArabicAddress'],
      englishAddress: json['EnglishAddress'],
      publisher: PublisherDetailsModel.fromJson(json['PublisherDetails']),
      contacts: ContactModel.fromJson(json),
      type: OfferType.fromId(json['Type']),
      area: json['Area'],
      price: json['Price'],
      longitude: json['Longitude'],
      latitude: json['Latitude'],
      image1: APIImagesHelper.toServerImage(json['ImageName1']),
      image2: APIImagesHelper.toServerImage(json['ImageName2']),
      image3: APIImagesHelper.toServerImage(json['ImageName3']),
      image4: APIImagesHelper.toServerImage(json['ImageName4']),
      timeAddedProperty: DateTime.parse(json["TimeAddedProperty"]),
    );
  }

  factory PropertyModel.fromEntity(PropertyEntity entity) {
    return PropertyModel(
      id: entity.id,
      arabicDescription: entity.arabicDescription,
      englishDescription: entity.englishDescription,
      arabicAddress: entity.arabicAddress,
      englishAddress: entity.englishAddress,
      publisher: PublisherDetailsModel.fromEntity(entity.publisher),
      contacts: ContactModel.fromEntity(entity.contacts),
      type: entity.type,
      area: entity.area,
      price: entity.price,
      longitude: entity.longitude,
      latitude: entity.latitude,
      timeAddedProperty: entity.timeAddedProperty,
      image1: entity.image1,
      image2: entity.image2,
      image3: entity.image3,
      image4: entity.image4,
      
    );
  }

  Future<Map<String, dynamic>> toJson() async {
    final map = {
      'ArabicDescription': arabicDescription,
      'EnglishDescription': englishDescription,
      'ArabicAddress': arabicAddress,
      'EnglishAddress': englishAddress,
      'WhatsappNumber': contacts.whatsapp,
      'Phonenumbers': contacts.phoneNumber,
      'Emails': contacts.email,
      'URls': contacts.urlSite,
      'PublisherDetails': PublisherDetailsModel.fromEntity(publisher).toJson(),
      'Type': type.id.toString(),
      'Area': area.toString(),
      'Price': price.toString(),
      'Longitude': longitude.toString(),
      'Latitude': latitude.toString(),
      'image1': await APIImagesHelper.convertImageToMultipartFile(image1),
      'image2': await APIImagesHelper.convertImageToMultipartFile(image2),
      'image3': await APIImagesHelper.convertImageToMultipartFile(image3),
      'image4': await APIImagesHelper.convertImageToMultipartFile(image4),
    };

    if (id != -1) {
      map['Id'] = id;
    }
    map["UserId"] = AppProvider().getProfile()!.id;

    // remove null values
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
