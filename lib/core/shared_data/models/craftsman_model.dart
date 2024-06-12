import '../../helpers/api_images_helper.dart';
import 'contact_model.dart';

import '../entities/craftsman_entity.dart';
import 'craft_model.dart';

class CraftsmanModel extends CraftsmanEntity {
  const CraftsmanModel({
    required super.id,
    required super.contact,
    required super.closing,
    required super.craftsModelId,
    required super.holidays,
    required super.craft,
    required super.descriptionAR,
    required super.descriptionEN,
    required super.addressAR,
    required super.addressEN,
    required super.userId,
    required super.nameAR,
    required super.nameEN,
    required super.profileImageUrl,
    required super.opening,
    super.imageName1,
    super.imageName2,
    super.imageName3,
    super.imageName4,
    super.reviewSummary,
    super.isBelongToMe,
  });

  factory CraftsmanModel.fromJson(Map<String, dynamic> json) {
    return CraftsmanModel(
      id: json['Id'],
      contact: ContactModel.fromJson(json),
      closing: json['Closing'],
      craftsModelId: json['CraftsModelId'],
      holidays: json['Holidays'],
      craft: CraftModel.fromJson(json['CraftsModel']),
      descriptionAR: json['CraftsMenDescriptionArabic'],
      descriptionEN: json['CraftsMenDescriptionEnglish'],
      addressAR: json['CraftsMenAddressArabic'],
      addressEN: json['CraftsMenAddressEnglish'],
      userId: json['UserId'],
      nameAR: json['CraftsMenNameArabic'],
      nameEN: json['CraftsMenNameEnglish'],
      opening: json['Opening'],
      profileImageUrl: APIImagesHelper.toServerImage(
        json['ProfileImageName'],
        addDefault: true,
      )!,
      imageName1: APIImagesHelper.toServerImage(json['CraftsMenImageName1']),
      imageName2: APIImagesHelper.toServerImage(json['CraftsMenImageName2']),
      imageName3: APIImagesHelper.toServerImage(json['CraftsMenImageName3']),
      imageName4: APIImagesHelper.toServerImage(json['CraftsMenImageName4']),
    );
  }

  factory CraftsmanModel.fromEntity(CraftsmanEntity entity) {
    return CraftsmanModel(
      id: entity.id,
      contact: entity.contact,
      closing: entity.closing,
      craftsModelId: entity.craftsModelId,
      holidays: entity.holidays,
      craft: entity.craft,
      descriptionAR: entity.descriptionAR,
      descriptionEN: entity.descriptionEN,
      addressAR: entity.addressAR,
      addressEN: entity.addressEN,
      userId: entity.userId,
      nameAR: entity.nameAR,
      nameEN: entity.nameEN,
      opening: entity.opening,
      profileImageUrl: entity.profileImageUrl,
      imageName1: entity.imageName1,
      imageName2: entity.imageName2,
      imageName3: entity.imageName3,
      imageName4: entity.imageName4,
      isBelongToMe: entity.isBelongToMe,
      reviewSummary: entity.reviewSummary,
    );
  }

  Future<Map<String, dynamic>> toJson() async {
    final map = {
      'UserId': userId,
      'CraftsMenAddressArabic': addressAR,
      'CraftsMenAddressEnglish': addressEN,
      'CraftsMenDescriptionArabic': descriptionAR,
      'CraftsMenDescriptionEnglish': descriptionEN,
      'CraftsMenNameArabic': nameAR,
      'CraftsMenNameEnglish': nameEN,
      'ProfileImage':
          await APIImagesHelper.convertImageToMultipartFile(profileImageUrl),
      'CraftsMenImage1':
          await APIImagesHelper.convertImageToMultipartFile(imageName1),
      'CraftsMenImage2':
          await APIImagesHelper.convertImageToMultipartFile(imageName2),
      'CraftsMenImage3':
          await APIImagesHelper.convertImageToMultipartFile(imageName3),
      'CraftsMenImage4':
          await APIImagesHelper.convertImageToMultipartFile(imageName4),
      'CraftsModelId': craftsModelId,
      'Closing': closing,
      'Opening': opening,
      'Holidays': holidays,
      "Phonenumbers": contact.phoneNumber,
      "Emails": contact.email,
      "URls": contact.urlSite,
    };

    if (id != -1) map['Id'] = id;

    if (profileImageUrl.isEmpty) map["ProfileImage"] = null;

    // remove null values
    map.removeWhere((key, value) => value == null);

    return map;
  }
}
