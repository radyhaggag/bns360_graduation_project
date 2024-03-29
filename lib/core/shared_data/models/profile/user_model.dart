import '../../entities/profile/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.userType,
    required super.userDescriptionAR,
    required super.userDescriptionEN,
    super.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      userDescriptionAR: map['userDescriptionAR'] as String?,
      userDescriptionEN: map['userDescriptionEN'] as String?,
      imageUrl: map['image_url'] as String?,
      userType: map['userType'] as int,
    );
  }
}
