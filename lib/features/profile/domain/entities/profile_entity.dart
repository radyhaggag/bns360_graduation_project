import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String name;
  final String email;
  final String? imageUrl;

  const ProfileEntity({
    required this.name,
    required this.email,
    this.imageUrl,
  });

  ProfileEntity copyWith({
    String? name,
    String? email,
    String? imageUrl,
  }) {
    return ProfileEntity(
      name: name ?? this.name,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object?> get props => [name, email, imageUrl];
}
