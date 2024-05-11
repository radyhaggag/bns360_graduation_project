import 'package:bns360_graduation_project/core/shared_data/entities/publisher_details_entity.dart';

class PublisherDetailsModel extends PublisherDetailsEntity {
  const PublisherDetailsModel({
    super.photoUrl,
    super.description,
    super.name,
  });

  factory PublisherDetailsModel.fromJson(Map<String, dynamic> json) {
    return PublisherDetailsModel(
      description: json["description"],
      photoUrl: json["photoUrl"],
      name: json["name"],
    );
  }

  factory PublisherDetailsModel.fromEntity(PublisherDetailsEntity entity) {
    return PublisherDetailsModel(
      photoUrl: entity.photoUrl,
      name: entity.name,
      description: entity.description,
    );
  }

  Map<String, dynamic> toJson() {
    return {"photoUrl": photoUrl, "description": description, "name": name};
  }
}
