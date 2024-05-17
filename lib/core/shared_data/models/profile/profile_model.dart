import '../../entities/profile/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  ProfileModel({
    required super.id,
    required super.email,
    required super.name,
    required super.userType,
    super.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'image_url': imageUrl,
      'userType': userType,
    };
  }

  factory ProfileModel.fromJson(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      imageUrl: map['image_url'] as String?,
      userType: map['userType'] as int,
    );
  }
}
