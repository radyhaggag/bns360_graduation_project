import 'package:equatable/equatable.dart';

import 'category_entity.dart';

class CategoryItemInfoEntity extends Equatable {
  final int id;
  final String businessNameArabic;
  final String businessNameEnglish;
  final CategoryEntity categoriesModel;
  final String profileImageName;
  final num totalReviews;
  final num averageRating;

  const CategoryItemInfoEntity({
    required this.id,
    required this.businessNameArabic,
    required this.businessNameEnglish,
    required this.categoriesModel,
    required this.profileImageName,
    required this.averageRating,
    required this.totalReviews,
  });

  @override
  List<Object?> get props {
    return [
      id,
      businessNameArabic,
      businessNameEnglish,
      totalReviews,
      averageRating,
      categoriesModel,
      profileImageName,
    ];
  }
}
