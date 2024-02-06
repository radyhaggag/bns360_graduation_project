import '../../domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.name,
    required super.email,
    required super.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'image_url': imageUrl,
    };
  }

  factory ProfileModel.fromJson(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['name'] as String,
      email: map['email'] as String,
      imageUrl: map['image_url'] as String,
    );
  }
}
