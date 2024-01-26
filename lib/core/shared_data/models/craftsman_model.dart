import '../entities/craftsman_entity.dart';
import 'craft_model.dart';

class CraftsmanModel extends CraftsmanEntity {
  const CraftsmanModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.numOfRatings,
    required super.averageRatings,
    required super.craft,
  });

  factory CraftsmanModel.fromJson(Map<String, dynamic> json) {
    return CraftsmanModel(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String,
      numOfRatings: json['num_of_ratings'] as int,
      averageRatings: json['stars_count'] as num,
      craft: CraftModel.fromJson(json['craft'] as Map<String, dynamic>),
    );
  }
}
