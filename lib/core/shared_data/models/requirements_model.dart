import '../entities/requirements_entity.dart';

class RequirementsModel extends RequirementsEntity {
  const RequirementsModel({required super.requirements});

  factory RequirementsModel.fromJson(List json) {
    final castList = List<Map<String, dynamic>>.from(
      json.map((e) => e as Map<String, dynamic>),
    );
    return RequirementsModel(
      requirements: List<String>.from(
        castList.map((e) => e["value"]),
      ),
    );
  }

  factory RequirementsModel.fromEntity(RequirementsEntity entity) {
    return RequirementsModel(requirements: entity.requirements);
  }

  List<Map<String, dynamic>> toJson() {
    return requirements.map((e) => {"Value": e}).toList();
  }
}
