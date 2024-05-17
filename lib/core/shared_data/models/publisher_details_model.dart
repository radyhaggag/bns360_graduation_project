import 'package:bns360_graduation_project/core/shared_data/entities/publisher_details_entity.dart';
import 'package:bns360_graduation_project/core/utils/enums/user_type.dart';

class PublisherDetailsModel extends PublisherDetailsEntity {
  const PublisherDetailsModel({
    required super.photoUrl,
    required super.userType,
    required super.name,
  });

  factory PublisherDetailsModel.fromJson(Map<String, dynamic> json) {
    return PublisherDetailsModel(
      userType: UserType.fromInteger(int.tryParse(json["description"]) ?? 0),
      photoUrl: json["photoUrl"],
      name: json["name"],
    );
  }

  factory PublisherDetailsModel.fromEntity(PublisherDetailsEntity entity) {
    return PublisherDetailsModel(
      photoUrl: entity.photoUrl,
      name: entity.name,
      userType: entity.userType,
    );
  }

  Map<String, dynamic> toJson() {
    return {"photoUrl": photoUrl, "description": userType.id.toString(), "name": name};
    // return {"PhotoUrl": photoUrl, "Description": userType.id.toString(), "Name": name};
  }
}
