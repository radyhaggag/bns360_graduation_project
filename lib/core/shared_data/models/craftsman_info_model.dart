import '../entities/craftsman_info_entity.dart';
import 'craft_model.dart';

class CraftsmanInfoModel extends CraftsmanInfoEntity {
  const CraftsmanInfoModel({
    required super.id,
    required super.craftsmanNameArabic,
    required super.craftsmanNameEnglish,
    required super.craft,
    required super.profileImageName,
    required super.averageRating,
    required super.totalReviews,
  });

  factory CraftsmanInfoModel.fromJson(Map<String, dynamic> json) {
    return CraftsmanInfoModel(
      id: json['Id'],
      craftsmanNameArabic: json['CraftsMenNameArabic'],
      craftsmanNameEnglish: json['CraftsMenNameEnglish'],
      craft: CraftModel.fromJson(json['CraftsModel']),
      profileImageName: json['ProfileImageName'],
      averageRating: json['AverageRating'],
      totalReviews: json['TotalReviews'],
    );
  }
}
