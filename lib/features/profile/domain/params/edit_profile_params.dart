import 'package:equatable/equatable.dart';

import '../../../../core/shared_data/entities/profile/profile_entity.dart';

class EditProfileParams extends Equatable {
  final String? name;
  final String? email;
  final String? newImagePath;
  final bool isProfileImageCleared;

  const EditProfileParams({
    this.name,
    this.email,
    this.newImagePath,
    required this.isProfileImageCleared,
  });

  EditProfileParams copyWith({
    String? name,
    String? email,
    String? newImagePath,
    bool? isProfileImageCleared,
  }) {
    return EditProfileParams(
      name: name ?? this.name,
      email: email ?? this.email,
      newImagePath: newImagePath ?? this.newImagePath,
      isProfileImageCleared:
          isProfileImageCleared ?? this.isProfileImageCleared,
    );
  }

  factory EditProfileParams.withoutImage({
    required String name,
    required String email,
  }) {
    return EditProfileParams(
      name: name,
      email: email,
      newImagePath: null,
      isProfileImageCleared: true,
    );
  }

  EditProfileParams fromProfileEntity(
    ProfileEntity profileEntity,
  ) {
    return copyWith(
      email: profileEntity.email,
      newImagePath: profileEntity.imageUrl,
      name: profileEntity.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'imageUrl': newImagePath,
    };
  }

  @override
  List<Object?> get props => [name, email, newImagePath];
}
