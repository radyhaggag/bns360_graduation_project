import '../entities/category_details_entity.dart';

class CategoryDetailsModel extends CategoryDetailsEntity {
  const CategoryDetailsModel({
    required super.id,
    required super.categoryId,
    required super.nameAR,
    required super.nameEN,
    required super.descriptionAR,
    required super.descriptionEN,
    required super.imageUrl,
    required super.starsCount,
    required super.numOfRatings,
  });

  factory CategoryDetailsModel.fromJson(Map<String, dynamic> json) {
    return CategoryDetailsModel(
      id: json['id'],
      categoryId: json['category_id'],
      nameAR: json['name_ar'],
      nameEN: json['name_en'],
      descriptionAR: json['description_ar'],
      descriptionEN: json['description_en'],
      imageUrl: json['image_url'],
      starsCount: json['stars_count'],
      numOfRatings: json['num_of_ratings'],
    );
  }
}
