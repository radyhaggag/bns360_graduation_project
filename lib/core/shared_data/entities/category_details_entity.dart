import 'package:equatable/equatable.dart';

class CategoryDetailsEntity extends Equatable {
  final int id;
  final int categoryId;
  final String nameAR;
  final String nameEN;
  final String descriptionAR;
  final String descriptionEN;
  final String imageUrl;
  final num starsCount;
  final int numOfRatings;

  const CategoryDetailsEntity({
    required this.id,
    required this.categoryId,
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
      categoryId,
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
