import '../entities/craft_entity.dart';

class CraftModel extends CraftEntity {
  const CraftModel({
    required super.id,
    required super.nameAR,
    required super.nameEN,
  });

  factory CraftModel.fromJson(Map<String, dynamic> json) {
    return CraftModel(
      id: json['Id'],
      nameAR: json['CraftsNameArabic'],
      nameEN: json['CraftsNameEnglish'],
    );
  }

  factory CraftModel.empty() {
    return const CraftModel(id: -1, nameAR: "", nameEN: "");
  }
}
