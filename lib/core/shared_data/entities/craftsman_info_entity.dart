import 'craft_entity.dart';
import 'package:equatable/equatable.dart';

class CraftsmanInfoEntity extends Equatable {
  final int id;
  final String craftsmanNameArabic;
  final String craftsmanNameEnglish;
  final CraftEntity craft;
  final String profileImageName;
  final num totalReviews;
  final num averageRating;

  const CraftsmanInfoEntity({
    required this.id,
    required this.craftsmanNameArabic,
    required this.craftsmanNameEnglish,
    required this.craft,
    required this.profileImageName,
    required this.averageRating,
    required this.totalReviews,
  });

  @override
  List<Object?> get props {
    return [
      id,
      craftsmanNameArabic,
      craftsmanNameEnglish,
      totalReviews,
      averageRating,
      craft,
      profileImageName,
    ];
  }
}
