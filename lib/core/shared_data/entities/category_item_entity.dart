import 'package:equatable/equatable.dart';

import 'category_entity.dart';

class CategoryItemEntity extends Equatable {
  final int id;
  final CategoryEntity category;
  final String nameAR;
  final String nameEN;
  final String descriptionAR;
  final String descriptionEN;
  final String imageUrl;
  final num starsCount;
  final int numOfRatings;

  const CategoryItemEntity({
    required this.id,
    required this.category,
    required this.nameAR,
    required this.nameEN,
    required this.descriptionAR,
    required this.descriptionEN,
    required this.imageUrl,
    required this.starsCount,
    required this.numOfRatings,
  });

  @override
  List<Object> get props {
    return [
      id,
      category,
      nameAR,
      nameEN,
      descriptionAR,
      descriptionEN,
      imageUrl,
      starsCount,
      numOfRatings,
    ];
  }
}
