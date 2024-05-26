import '../../utils/enums/user_type.dart';
import '../entities/publisher_details_entity.dart';

class PublisherDetailsModel extends PublisherDetailsEntity {
  const PublisherDetailsModel({
    required super.photoUrl,
    required super.userType,
    required super.name,
  });

  factory PublisherDetailsModel.fromJson(Map<String, dynamic> json) {
    return PublisherDetailsModel(
      userType: UserType.fromInteger(int.tryParse(json["Description"]) ?? 0),
      photoUrl: json["PhotoUrl"],
      name: json["Name"],
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
    return {"PhotoUrl": photoUrl, "Description": userType.id.toString(), "Name": name};
    // return {"PhotoUrl": photoUrl, "Description": userType.id.toString(), "Name": name};
  }
}
