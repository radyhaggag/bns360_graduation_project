import 'package:bns360_graduation_project/core/shared_data/entities/category_item_info_entity.dart';
import 'package:bns360_graduation_project/core/shared_data/models/category_model.dart';

class CategoryItemInfoModel extends CategoryItemInfoEntity {
  const CategoryItemInfoModel({
    required super.id,
    required super.businessNameArabic,
    required super.businessNameEnglish,
    required super.categoriesModel,
    required super.profileImageName,
    required super.averageRating,
    required super.totalReviews,
  });

  factory CategoryItemInfoModel.fromJson(Map<String, dynamic> json) {
    return CategoryItemInfoModel(
      id: json['id'],
      businessNameArabic: json['businessNameArabic'],
      businessNameEnglish: json['businessNameEnglish'],
      categoriesModel: CategoryModel.fromJson(json['category']),
      profileImageName: json['profileImageName'],
      averageRating: json['averageRating'],
      totalReviews: json['totalReviews'],
    );
  }
}
