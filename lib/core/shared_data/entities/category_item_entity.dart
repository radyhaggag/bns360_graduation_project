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
  final List<String> businessImages;
  final num starsCount;
  final int numOfRatings;
  final String address;
  final double lat;
  final double lng;
  final bool isBelongToMe;

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
    required this.address,
    required this.businessImages,
    required this.lat,
    required this.lng,
    this.isBelongToMe = false,
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
      address,
      businessImages,
    ];
  }

  CategoryItemEntity copyWith({
    int? id,
    CategoryEntity? category,
    String? nameAR,
    String? nameEN,
    String? descriptionAR,
    String? descriptionEN,
    String? imageUrl,
    List<String>? businessImages,
    num? starsCount,
    int? numOfRatings,
    String? address,
    double? lat,
    double? lng,
    bool? isBelongToMe,
  }) {
    return CategoryItemEntity(
      id: id ?? this.id,
      category: category ?? this.category,
      nameAR: nameAR ?? this.nameAR,
      nameEN: nameEN ?? this.nameEN,
      descriptionAR: descriptionAR ?? this.descriptionAR,
      descriptionEN: descriptionEN ?? this.descriptionEN,
      imageUrl: imageUrl ?? this.imageUrl,
      businessImages: businessImages ?? this.businessImages,
      starsCount: starsCount ?? this.starsCount,
      numOfRatings: numOfRatings ?? this.numOfRatings,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      isBelongToMe: isBelongToMe ?? this.isBelongToMe,
    );
  }
}
