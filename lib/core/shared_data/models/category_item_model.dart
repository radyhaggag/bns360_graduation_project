import '../entities/category_item_entity.dart';

class CategoryItemModel extends CategoryItemEntity {
  const CategoryItemModel({
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

  factory CategoryItemModel.fromJson(Map<String, dynamic> json) {
    return CategoryItemModel(
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
