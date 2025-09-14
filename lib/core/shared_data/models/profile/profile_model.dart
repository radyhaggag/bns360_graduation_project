import '../../../helpers/api_images_helper.dart';
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
      id: map['Id'] as String,
      name: map['DisplayName'] as String,
      email: map['Email'] as String,
      imageUrl: map['profileImageName'] != null? APIImagesHelper.toServerImage(map['profileImageName']):null,
      userType: map['UserRole'] as int,
    );
  }
}
