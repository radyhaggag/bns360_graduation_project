import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String categoryNameArabic;
  final String categoryNameEnglish;
  final String image;

  const CategoryEntity({
    required this.id,
    required this.categoryNameArabic,
    required this.categoryNameEnglish,
    required this.image,
  });

  @override
  List<Object> get props => [id, categoryNameArabic, categoryNameEnglish, image];
}
