import '../entities/category_item_info_entity.dart';
import 'category_model.dart';

class CategoryItemInfoModel extends CategoryItemInfoEntity {
  const CategoryItemInfoModel({
    required super.id,
    required super.businessNameArabic,
    required super.businessNameEnglish,
    required super.categoriesModel,
    required super.profileImageName,
    required super.averageRating,
    required super.totalReviews,
    super.businessDescriptionArabic,
    super.businessDescriptionEnglish,
  });

  factory CategoryItemInfoModel.fromJson(Map<String, dynamic> json) {
    return CategoryItemInfoModel(
      id: json['id'],
      businessNameArabic: json['BusinessNameArabic'],
      businessNameEnglish: json['BusinessNameEnglish'],
      categoriesModel: json['Category'] != null
          ? CategoryModel.fromJson(json['Category'])
          : CategoryModel.empty(),
      profileImageName: json['ProfileImageName'],
      averageRating: json['AverageRating'],
      totalReviews: json['TotalReviews'],
      businessDescriptionArabic: json['BusinessDescriptionArabic'],
      businessDescriptionEnglish: json['BusinessDescriptionEnglish'],
    );
  }
}
