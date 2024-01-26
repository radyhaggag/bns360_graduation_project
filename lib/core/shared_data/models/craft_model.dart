import '../entities/craft_entity.dart';

class CraftModel extends CraftEntity {
  const CraftModel({
    required super.id,
    required super.nameAR,
    required super.nameEN,
  });

  factory CraftModel.fromJson(Map<String, dynamic> json) {
    return CraftModel(
      id: json['id'],
      nameAR: json['name_ar'],
      nameEN: json['name_en'],
    );
  }
}
