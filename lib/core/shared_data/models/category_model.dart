import '../entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.nameAR,
    required super.nameEN,
    required super.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      nameAR: json['name_ar'],
      nameEN: json['name_en'],
      imageUrl: json['image_url'],
    );
  }
}
