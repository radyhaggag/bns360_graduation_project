import 'package:equatable/equatable.dart';

import '../entities/profile_entity.dart';

class EditProfileParams extends Equatable {
  final String? name;
  final String? email;
  final String? imageUrl;

  const EditProfileParams({
    this.name,
    this.email,
    this.imageUrl,
  });

  EditProfileParams copyWith({
    String? name,
    String? email,
    String? imageUrl,
  }) {
    return EditProfileParams(
      name: name ?? this.name,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  EditProfileParams fromProfileEntity(
    ProfileEntity profileEntity,
  ) {
    return copyWith(
      email: profileEntity.email,
      imageUrl: profileEntity.imageUrl,
      name: profileEntity.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
    };
  }

  @override
  List<Object?> get props => [name, email, imageUrl];
}
