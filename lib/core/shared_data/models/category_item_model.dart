import '../../helpers/api_images_helper.dart';
import '../entities/category_item_entity.dart';
import 'category_model.dart';
import 'contact_model.dart';

class CategoryItemModel extends CategoryItemEntity {
  const CategoryItemModel({
    required super.userId,
    required super.id,
    required super.businessAddressArabic,
    required super.businessAddressEnglish,
    required super.businessDescriptionArabic,
    required super.businessDescriptionEnglish,
    required super.businessNameArabic,
    required super.businessNameEnglish,
    required super.categoriesModel,
    required super.categoriesModelId,
    required super.closing,
    required super.opening,
    required super.profileImageName,
    required super.holidays,
    required super.contacts,
    required super.longitude,
    required super.latitude,
    super.businessImageName1,
    super.businessImageName2,
    super.businessImageName3,
    super.businessImageName4,
  });

  factory CategoryItemModel.fromJson(Map<String, dynamic> json) {
    return CategoryItemModel(
      userId: json['userId'],
      id: json['id'],
      businessAddressArabic: json['businessAddressArabic'],
      businessAddressEnglish: json['businessAddressEnglish'],
      businessDescriptionArabic: json['businessDescriptionArabic'],
      businessDescriptionEnglish: json['businessDescriptionEnglish'],
      profileImageName: APIImagesHelper.toServerImage(
        json['profileImageName'],
        addDefault: true,
      )!,
      businessImageName1:
          APIImagesHelper.toServerImage(json['businessImageName1']),
      businessImageName2:
          APIImagesHelper.toServerImage(json['businessImageName2']),
      businessImageName3:
          APIImagesHelper.toServerImage(json['businessImageName3']),
      businessImageName4:
          APIImagesHelper.toServerImage(json['businessImageName4']),
      businessNameArabic: json['businessNameArabic'],
      businessNameEnglish: json['businessNameEnglish'],
      categoriesModel: CategoryModel.fromJson(json['categoriesModel']),
      categoriesModelId: json['categoriesModelId'],
      closing: json['closing'],
      opening: json['opening'],
      holidays: json['holidays'],
      contacts: ContactModel.fromJson(json),
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Future<Map<String, dynamic>> toJson() async {
    final map = {
      'UserId': userId,
      'BusinessAddressArabic': businessAddressArabic,
      'BusinessAddressEnglish': businessAddressEnglish,
      'BusinessDescriptionArabic': businessDescriptionArabic,
      'BusinessDescriptionEnglish': businessDescriptionEnglish,
      'BusinessNameArabic': businessNameArabic,
      'BusinessNameEnglish': businessNameEnglish,
      'ProfileImage':
          await APIImagesHelper.convertImageToMultipartFile(profileImageName),
      'BusinessImage1':
          await APIImagesHelper.convertImageToMultipartFile(businessImageName1),
      'BusinessImage2':
          await APIImagesHelper.convertImageToMultipartFile(businessImageName2),
      'BusinessImage3':
          await APIImagesHelper.convertImageToMultipartFile(businessImageName3),
      'BusinessImage4':
          await APIImagesHelper.convertImageToMultipartFile(businessImageName4),
      'CategoriesModelId': categoriesModelId,
      'Closing': closing,
      'Opening': opening,
      'Holidays': holidays,
      "Phonenumbers": contacts.phoneNumber,
      "Emails": contacts.email,
      "URls": contacts.urlSite,
      "Latitude": latitude,
      "Longitude": longitude,
    };

    if (id != -1) {
      map['Id'] = id;
    }

    if (profileImageName.isEmpty) {
      map["ProfileImage"] = null;
    }

    // remove null values
    map.removeWhere((key, value) => value == null);

    return map;
  }

  factory CategoryItemModel.fromEntity(CategoryItemEntity entity) {
    return CategoryItemModel(
      userId: entity.userId,
      id: entity.id,
      businessAddressArabic: entity.businessAddressArabic,
      businessAddressEnglish: entity.businessAddressEnglish,
      businessDescriptionArabic: entity.businessDescriptionArabic,
      businessDescriptionEnglish: entity.businessDescriptionEnglish,
      businessImageName1: entity.businessImageName1,
      businessImageName2: entity.businessImageName2,
      businessImageName3: entity.businessImageName3,
      businessImageName4: entity.businessImageName4,
      businessNameArabic: entity.businessNameArabic,
      businessNameEnglish: entity.businessNameEnglish,
      categoriesModel: entity.categoriesModel,
      categoriesModelId: entity.categoriesModelId,
      closing: entity.closing,
      holidays: entity.holidays,
      contacts: entity.contacts,
      opening: entity.opening,
      profileImageName: entity.profileImageName,
      latitude: entity.latitude,
      longitude: entity.longitude,
    );
  }
}
