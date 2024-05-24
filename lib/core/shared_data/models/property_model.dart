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
      id: json['id'],
      arabicDescription: json['arabicDescription'],
      englishDescription: json['englishDescription'],
      arabicAddress: json['arabicAddress'],
      englishAddress: json['englishAddress'],
      publisher: PublisherDetailsModel.fromJson(json['publisherDetails']),
      contacts: ContactModel.fromJson(json),
      type: OfferType.fromId(json['type']),
      area: json['area'],
      price: json['price'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      image1: APIImagesHelper.toServerImage(json['imageName1']),
      image2: APIImagesHelper.toServerImage(json['imageName2']),
      image3: APIImagesHelper.toServerImage(json['imageName3']),
      image4: APIImagesHelper.toServerImage(json['imageName4']),
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

    // remove null values
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
