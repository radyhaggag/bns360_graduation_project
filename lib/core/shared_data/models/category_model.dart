import 'package:bns360_graduation_project/core/helpers/api_images_helper.dart';

import '../entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.categoryNameArabic,
    required super.categoryNameEnglish,
    required super.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      categoryNameArabic: json['categoryNameArabic'],
      categoryNameEnglish: json['categoryNameEnglish'],
      image: APIImagesHelper.toServerImage(
        json['imageFileName'],
        addDefault: true,
      )!,
    );
  }

  factory CategoryModel.empty() {
    return const CategoryModel(
      id: -1,
      categoryNameArabic: "",
      categoryNameEnglish: "",
      image: "",
    );
  }
}
