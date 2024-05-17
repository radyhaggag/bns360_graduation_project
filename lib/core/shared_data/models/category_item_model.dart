import 'package:bns360_graduation_project/core/shared_data/models/category_model.dart';

import '../entities/category_item_entity.dart';
import 'contact_model.dart';

class CategoryItemModel extends CategoryItemEntity {
  const CategoryItemModel({
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
      id: json['id'],
      businessAddressArabic: json['businessAddressArabic'],
      businessAddressEnglish: json['businessAddressEnglish'],
      businessDescriptionArabic: json['businessDescriptionArabic'],
      businessDescriptionEnglish: json['businessDescriptionEnglish'],
      businessImageName1: json['businessImageName1'],
      businessImageName2: json['businessImageName2'],
      businessImageName3: json['businessImageName3'],
      businessImageName4: json['businessImageName4'],
      businessNameArabic: json['businessNameArabic'],
      businessNameEnglish: json['businessNameEnglish'],
      categoriesModel: CategoryModel.fromJson(json['categoriesModel']),
      categoriesModelId: json['categoriesModelId'],
      closing: json['closing'],
      opening: json['opening'],
      profileImageName: json['profileImageName'],
      holidays: json['holidays'],
      contacts: ContactModel.fromJson(json),
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = {
      'BusinessAddressArabic': businessAddressArabic,
      'BusinessAddressEnglish': businessAddressEnglish,
      'BusinessDescriptionArabic': businessDescriptionArabic,
      'BusinessDescriptionEnglish': businessDescriptionEnglish,
      'BusinessImageName1': businessImageName1,
      'BusinessImageName2': businessImageName2,
      'BusinessImageName3': businessImageName3,
      'BusinessImageName4': businessImageName4,
      'BusinessNameArabic': businessNameArabic,
      'BusinessNameEnglish': businessNameEnglish,
      'CategoriesModelId': categoriesModelId,
      'Closing': closing,
      'Opening': opening,
      'ProfileImageName': profileImageName,
      'Holidays': holidays,
      "Phonenumbers": contacts.phoneNumber,
      "Emails": contacts.email,
      "URls": contacts.urlSite,
      "Latitude": latitude,
      "Longitude": longitude,
    };

    if (id != -1) {
      map.addAll({'id': id});
    }
    return map;
  }

  factory CategoryItemModel.fromEntity(CategoryItemEntity entity) {
    return CategoryItemModel(
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
